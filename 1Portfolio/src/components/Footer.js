import React from "react";
import Layout from "./Layout";
import Link from "next/link";

const Footer = () => {
    return (
        <footer className='w-full border-t-2 border-solid border-dark font-medium text-lg'>
            <Layout className='py-8 flex items-center justify-between'>
                <span>{new Date().getFullYear()} &copy; All Rights Reserved.</span>
                <div className='flex items-center'>
                    Build With
                    &nbsp;<Link href="https://es.react.dev/" className='underline underline-offset-2
                    'target={"_blank"}>React</Link>
                </div>
            </Layout>
        </footer>
    )
}

export default Footer