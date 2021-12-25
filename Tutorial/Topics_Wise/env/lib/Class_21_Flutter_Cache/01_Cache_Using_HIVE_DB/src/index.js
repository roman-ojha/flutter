const express=require('express');
const app=express();
const PORT=8080;

app.get("/",(req,res)=>{
    res.send("<a href='/api/data'>Data</a>")
})

app.get('/api/data',(req,res)=>{
    const data=[
        {
            "name":"Roman ojha",
            "marks":542,
        },
        {
            "name":"Ram Baral",
            "marks":42,
        },
        {
            "name":"Ritesh Baral",
            "marks":54,
        },
        {
            "name":"Harry rijal",
            "marks":52,
        },
        {
            "name":"Tom hollend",
            "marks":532,
        },
    ]
    res.json(data);
})

app.listen(PORT,()=>{
    console.log(`Running server on ${PORT}`);
})