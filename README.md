# Merging VCF Contacts

Simple tool to merge VCF contact files into one single contact file. Useful when your mail providers function to export contacts generates a single 
file for each contact. Instead of importing them one by one you can use this tool to merge all files into one file. After that you can import
a single file containing all your contacts into another account.

## Prerequisites

Unfortunatly you have to use `Powershell 7.0` or later. `Powershell 5.1` does not properly support charset `utf-8 without bom`.

## Usage

1. Download latest `Get-MergedVcf.ps1` from [release page](https://github.com/iodar/ps-vcf-merger/releases)
2. Run `.\Get-MergedVcf.ps1 -SourcePath .\path\to\vcf-files -DestinationPath all.vcf`
3. Use single file to import contacts else where

## Advanced Usage

| Parameter          | Usage                                                                                                                                          | Example                                                                                        |
| ------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------- |
| `-SourcePath`      | Path to folder containing `*.vcf` files                                                                                                        | See section **Usage**                                                                          |
| `-DestinationPath` | Full path to destination file (where merged contacts will be saved)                                                                            | See section **Usage**                                                                          |
| `-Exclude`         | File names of files that should be excluded from merging (files need to be located in `-SourcePath` folder, full file paths are not supported) | `.\Get-MergedVcf.ps1 -SourcePath . -DestinationPath all.vcf -Exclude "work.vcf", "school.vcf"` |

## Current State

The tool currently only supports VCF files with `utf-8` encoding. It has not been tested with other encodings or other Powershell versions than `7.0`.