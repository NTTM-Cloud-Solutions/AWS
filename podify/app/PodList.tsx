import {
  Table,
  TableBody,
  TableCaption,
  TableCell,
  TableFooter,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";

// Adding a TypeScript interface for episode type, adjust according to actual data structure
interface Episode {
  id: string;
  name: string;
  description: string;
  html_description: string;
  duration_ms: number;
  explicit: boolean;
  audio_preview_url: string;
  external_urls: {
    spotify: string;
  };
  href: string;
  images: Array<{
    height: number;
    url: string;
    width: number;
  }>;
  is_externally_hosted: boolean;
  is_playable: boolean;
  language: string;
  languages: string[];
  release_date: string;
  release_date_precision: string;
  type: string;
  uri: string;
}

interface PodListProps {
  episodes: Episode[]; // Expecting episodes array as a prop
}

export function PodList({ episodes }: PodListProps) {
  return (
    <Table>
      <TableHeader>
        <TableRow className="text-right">
          <TableHead className="text-right">ID</TableHead>
          <TableHead className="text-right">שם</TableHead>
          <TableHead className="text-right">תאריך</TableHead>
          <TableHead className="text-right">לינק</TableHead>
        </TableRow>
      </TableHeader>
      <TableBody>
        {episodes.map((episode) => (
          <TableRow key={episode.id}>
            <TableCell className="font-medium">{episode.id}</TableCell>
            <TableCell>{episode.name}</TableCell>
            <TableCell>{episode.release_date}</TableCell>
            <TableCell className="text-right">{episode.uri}</TableCell>
          </TableRow>
        ))}
      </TableBody>
    </Table>
  )
}
