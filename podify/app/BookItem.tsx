'use client'
import React from 'react'
import { Card, CardContent } from '@/components/ui/card'

export const BookItem = (props: any) => {
    return (
        <div className="p-1" style={{ background: props.img }}>
            <Card >
                <CardContent className="flex aspect-square items-center justify-center p-6">
                    <span className="text-4xl font-semibold">{props.index + 1}</span>
                </CardContent>
            </Card>
        </div>
    )
}
