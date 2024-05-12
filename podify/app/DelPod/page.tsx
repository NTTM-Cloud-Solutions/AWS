"use client";

import { zodResolver } from "@hookform/resolvers/zod";
import { useForm } from "react-hook-form";
import { z } from "zod";

import { Textarea } from "@/components/ui/textarea";
import { Button } from "@/components/ui/button";
import {
  Form,
  FormControl,
  FormDescription,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from "@/components/ui/form";
import { Input } from "@/components/ui/input";

const podcastEpisodeSchema = z.object({
  id: z.string(),
  name: z.string(),
  description: z.string(),
  images: z.array(
    z.object({
      url: z.string(),
      height: z.number(),
      width: z.number(),
    })
  ),
  uri: z.string(),
  release_date: z.string(),
  duration: z.number(),
});

export default function AddPod() {
  const form = useForm<z.infer<typeof podcastEpisodeSchema>>({
    resolver: zodResolver(podcastEpisodeSchema),
    defaultValues: {
      id: "123",
      name: "The Joe Rogan Experience",
      description: "The Joe Rogan Experience podcast",
      images: [
        {
          url: "https://example.com/joe-rogan.jpg",
          height: 640,
          width: 640,
        },
      ],
      uri: "https://example.com/joe-rogan",
      release_date: "2021-09-01",
      duration: 3600,
    },
  });
  function onSubmit(values: z.infer<typeof podcastEpisodeSchema>) {
    // Do something with the form values.
    // ✅ This will be type-safe and validated.
    console.log(values);
  }

  const { control, handleSubmit } = useForm();

  return (
    <>
      <div className="max-w-md mx-auto">
        <Form {...form}>
          <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-8">
          <FormField
            control={control}
            name="name"
            render={({ field }) => (
              <FormItem>
                <FormLabel>Name</FormLabel>
                <FormControl>
                  <Input placeholder="Episode Name" {...field} />
                </FormControl>
              </FormItem>
            )}
          />
          <FormField
            control={control}
            name="description"
            render={({ field }) => (
              <FormItem>
                <FormLabel>Description</FormLabel>
                <FormControl>
                  <Textarea placeholder="Episode Description" {...field} />
                </FormControl>
              </FormItem>
            )}
          />
          <FormField
            control={control}
            name="release_date"
            render={({ field }) => (
              <FormItem>
                <FormLabel>Release Date</FormLabel>
                <FormControl>
                  <Input type="date" {...field} />
                </FormControl>
              </FormItem>
            )}
          />
          {/* add image */}
          <FormField
            control={control}
            name="images"
            render={({ field }) => (
              <FormItem>
                <FormLabel>Image</FormLabel>
                <FormControl>
                  <Input type="file" {...field} />
                </FormControl>
              </FormItem>
            )}
          />
            <Button type="submit">Submit</Button>
          </form>
        </Form>
      </div>
    </>
  );
}
