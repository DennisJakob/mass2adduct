context("Basic tests")
library(mass2adduct)

test_that("Included data files are present", {
    expect_true(file.exists(system.file("extdata","msi.csv",package="mass2adduct")))
    expect_true(file.exists(system.file("extdata","mass_example",package="mass2adduct")))
})

d <- msimat(system.file("extdata","msi.csv",package="mass2adduct"),sep=";")
peaklist <- scan(system.file("extdata","mass_example",package="mass2adduct"),what=numeric())

test_that("Import file classes", {
    expect_is(d, "msimat")
    expect_is(peaklist, "numeric")
})

d.diff <- massdiff(d)

test_that("Diff calculation", {
    expect_message(peaklist.diff <- massdiff(peaklist))
    expect_is(d.diff,"massdiff")
    expect_is(peaklist.diff,"massdiff")
    expect_equal(dim(d.diff),c(choose(length(d$peaks),2),3))
})

test_that("Diff histogram and annotation", {
    d.diff.hist <- hist(d.diff)
    expect_is(d.diff.hist,"histogram")
    d.diff.hist.annot <- adductMatch(d.diff.hist,add=adducts2)
    expect_is(d.diff.hist.annot,"data.frame")
    expect_equal(dim(d.diff.hist.annot),c(9,5))
})

d.diff.annot <- adductMatch(d.diff,add=adducts2)

test_that("Adduct matching", {
    expect_is(d.diff.annot,"massdiff")
    expect_is(d.diff.annot,"data.frame")
    expect_equal(dim(d.diff.annot),c(2805,4))
})

test_that("Correlation testing", {
    expect_message(d.diff.annot.cor <- corrPairsMSI(d,d.diff.annot))
    expect_is(d.diff.annot.cor,"data.frame")
    expect_equal(sum(d.diff.annot.cor$Significance),1229)
})

# Cleanup
rm(d,peaklist,d.diff,d.diff.annot)