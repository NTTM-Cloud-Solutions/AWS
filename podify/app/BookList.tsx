import * as React from "react"

import { Button } from "@/components/ui/button"
import {
  Card,
  CardContent,
  CardDescription,
  CardFooter,
  CardHeader,
  CardTitle,
} from "@/components/ui/card"

export function BookList() {
  return (
    <Card className="w-full">
      <CardHeader>
        <CardTitle>Choose Book</CardTitle>
        <CardDescription></CardDescription>
      </CardHeader>
      <CardContent>
        <Button variant="outline" className="w-full mb-2">Book 1</Button>
        <Button variant="outline" className="w-full mb-2">Book 2</Button>
        <Button variant="outline" className="w-full mb-2">Book 3</Button>
        <Button variant="outline" className="w-full mb-2">Book 4</Button>
        <Button variant="outline" className="w-full mb-2">Book 5</Button>
        <Button variant="outline" className="w-full mb-2">Book 6</Button>
        <Button variant="outline" className="w-full mb-2">Book 7</Button>
      </CardContent>
    </Card>
  )
}
