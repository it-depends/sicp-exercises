﻿module Files

open System
open System.IO
open System.Text.RegularExpressions

open Common
open Model
open Regex

let htmlRoot = Common.htmlRoot
//printfn "Got Html Directory: %s" htmlRoot

let fileSortKey file =
    match Regex.Match(file, @"\d+").Value with
        | "" -> "0"
        | text -> text
    |> int

let htmlFiles = 
    (new DirectoryInfo(htmlRoot)).GetFiles("*.html")
    |> Array.sortBy (fun file -> fileSortKey file.FullName)

let xmlEscapeRx = new Regex("""[&<>'"]""", RegexOptions.Compiled)
let xmlEscape text = 
    xmlEscapeRx.Replace(text, (fun (m : Match) ->
        match m.Value with
        | "&" -> "&amp;"
        | "<" -> "&lt;"
        | ">" -> "&gt;"
        | "'" -> "&apos;"
        | "\"" -> "&quot;"
        | unexpected -> failwith "got unexpected: " + unexpected))

let matches (regex : Regex) (string : String) (start : int)   =
    let matches = 
        regex.Matches(string.Trim(), start)
        |> Seq.cast<Match>
        |> List.ofSeq
    matches

let title place =    
    let m = titleRx.Match(place.String, place.Index)
    match m.Success with
    | false -> None, None, place
    | true -> 
    let title = Some (Title m.Groups.["title"].Value)

    let mId = m.Groups.["id"]
    let id = 
        match mId.Success with
        | true -> Some (Id mId.Value)
        | false -> None
    (id, title, {place with Index = m.Index + m.Length})

let epigraph place =
    let m = epigraphRx.Match(place.String, place.Index)
    let e =  
        match m.Success with
        | true -> Some (Epigraph m.Value)
        | false -> None
    (e, {place with Index = m.Index + m.Length})

let prose place =
    let m = proseRx.Match(place.String, place.Index)
    (Prose (Html m.Value), {place with Index = m.Index})

let matter place = 
    let _, title, place = title place
    let epigraph, place = epigraph place
    let prose, _ = prose place
    Matter {
        Title = title;
        Epigraph = epigraph; 
        Prose = prose;
        Html = Html place.String }

let block title textId (m : Match) = 
    let str = m.Value
    match m.Groups.["exercise"].Success with
    | false -> Block.Prose (Prose (Html str))
    | true -> Block.Exercise {
        ExerciseSrc.Id = Id m.Groups.["id"].Value
        Html = Html m.Value
        TextTitle = title
        TextId = textId
    }

let blocks title textId (m : Match) =
    matches blockRx (m.Value) 0 
    |> List.map (block title textId)

let chapter place =
    let id, title, place = title place
    let epigraph, place = epigraph place
    let prose, _ = prose place
    Chapter{
        Id = id.Value;
        Title = title.Value;
        Epigraph = epigraph.Value;
        Prose = prose;
        Html = Html place.String;
    }
    
let subsection (m : Match) =
    let id, title, place = title {String = m.Value; Index = 0; }
    let blocks = blocks title.Value id.Value m
    {
        Subsection.Id = id.Value;
        Title = title.Value;
        Blocks = blocks;
        Html = Html place.String
    }

let subsections place =   
    matches subsectionRx place.String place.Index
    |> List.map subsection
    
let section place =
    let id, title, place = title place

    let text = proseRx.Match(place.String, place.Index)
    let blocks = blocks title.Value id.Value (text)
    let prose, ex =
        match blocks with 
        | [Block.Prose pr] -> pr, None
        | [Block.Prose pr; Block.Exercise ex] -> pr, Some ex
        | _ -> failwith "Make the mean man stop"


    let subsections = subsections place
    Section{
        Id = id.Value;
        Title = title.Value;
        Prose = prose;
        Exercise = ex;
        Subsections = subsections;
        Html = Html place.String;
    }

let parseFile (file : FileInfo) = 
    let text = File.ReadAllText(file.FullName)
    let place = {String = text; Index = 0;}
    {    
        SicpFile.Id = Id file.Name;
        Document =      
            match text with
            | ChapterRx t -> chapter place
            | SectionRx t -> section place
            | _ -> matter place
    }

let files () =  htmlFiles |> Array.map parseFile

