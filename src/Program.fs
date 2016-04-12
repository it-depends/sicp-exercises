﻿open System
open System.Text

open Exercises
open Outline
open Model


// http://www.fileformat.info/info/unicode/char/b2/browsertest.htm
// http://www.sunilpatel.co.uk/wp-content/uploads/2010/08/Lowercase-Greek-Symbols.jpg
// http://symbolcodes.tlt.psu.edu/bylanguage/mathchart.html

[<EntryPoint>]
let main argv =
    let files = Files.files ()
    
//    files
//    |> Seq.collect outline
//    |> Seq.iter (printfn "%s")

    let exercises = 
        files 
        |> allExercises 
        |> List.ofSeq

//    let sparse =
//        exercises 
//        |> List.map (fun x -> x.Text)
    
    exercises |> List.iter write


    let xx = 
        exercises 
        |> List.skip 0//(46 + 97 + 82 + 79 + 46)
        
    xx |> Seq.iter (fun x ->
        Console.Clear ()
        desc x.Text
        Console.ReadKey () |> ignore )
    
    printfn "%s" "Done."
    Console.ReadKey() |> ignore
    0