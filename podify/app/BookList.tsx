"use client";
import * as React from "react";
import Autoplay from "embla-carousel-autoplay";

import { BookItem } from "@/app/BookItem";
import { Card, CardContent } from "@/components/ui/card";
import {
  Carousel,
  CarouselContent,
  CarouselItem,
  CarouselNext,
  CarouselPrevious,
} from "@/components/ui/carousel";
import { Book } from "lucide-react";

export function BookList() {
    const img_uri = "/bookcover1.jpg";
  const plugin = React.useRef(
    Autoplay({ delay: 2000, stopOnInteraction: true })
  );

return (
    <Carousel
        plugins={[plugin.current]}
        className="flex w-full max-w-xs items-center justify-center mx-auto mt-8 md:max-w-3xl lg:max-w-4xl xl:max-w-5xl"
        onMouseEnter={plugin.current.stop}
        onMouseLeave={plugin.current.reset}
    >
        <CarouselContent>
            <CarouselItem key={0} className="md:basis-1/2 lg:basis-1/4">
                <div className="p-1">
                    <Card>
                        <CardContent className="flex aspect-square items-center justify-center p-6">
                            <span className="text-4xl font-semibold">All Books</span>
                        </CardContent>
                    </Card>
                </div>
            </CarouselItem>
            {Array.from({ length: 7 }).map((_, index) => (
                <CarouselItem key={index + 1} className="md:basis-1/2 lg:basis-1/4">
                    <BookItem index={index} img={img_uri}/>
                </CarouselItem>
            ))}
        </CarouselContent>
        <CarouselPrevious />
        <CarouselNext />
    </Carousel>
);
}
