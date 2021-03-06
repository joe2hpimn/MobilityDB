﻿-------------------------------------------------------------------------------

ANALYZE tbl_tgeompoint3D_big;
ANALYZE tbl_tgeogpoint3D_big;

DROP INDEX IF EXISTS tbl_tgeompoint3D_big_spgist_idx;
DROP INDEX IF EXISTS tbl_tgeogpoint3D_big_spgist_idx;

-------------------------------------------------------------------------------

CREATE INDEX tbl_tgeompoint3D_big_spgist_idx ON tbl_tgeompoint3D_big USING SPGIST(temp);
CREATE INDEX tbl_tgeogpoint3D_big_spgist_idx ON tbl_tgeogpoint3D_big USING SPGIST(temp);

SELECT count(*) FROM tbl_tgeompoint3D_big WHERE temp && geometry 'Linestring(1 1 1,10 10 10)';
SELECT count(*) FROM tbl_tgeompoint3D_big WHERE temp @> geometry 'Linestring(1 1 1,10 10 10)';
SELECT count(*) FROM tbl_tgeompoint3D_big WHERE temp <@ geometry 'Linestring(1 1 1,10 10 10)';
SELECT count(*) FROM tbl_tgeompoint3D_big WHERE temp ~= geometry 'Linestring(1 1 1,10 10 10)';
SELECT count(*) FROM tbl_tgeompoint3D_big WHERE temp -|- geometry 'Linestring(1 1 1,10 10 10)';

SELECT count(*) FROM tbl_tgeompoint3D_big WHERE temp && tgeompoint '[Point(1 1 1)@2000-01-01, Point(10 10 10)@2000-01-02]';
SELECT count(*) FROM tbl_tgeompoint3D_big WHERE temp @> tgeompoint '[Point(1 1 1)@2000-01-01, Point(10 10 10)@2000-01-02]';
SELECT count(*) FROM tbl_tgeompoint3D_big WHERE temp <@ tgeompoint '[Point(1 1 1)@2000-01-01, Point(10 10 10)@2000-01-02]';
SELECT count(*) FROM tbl_tgeompoint3D_big WHERE temp ~= tgeompoint '[Point(1 1 1)@2000-01-01, Point(10 10 10)@2000-01-02]';
SELECT count(*) FROM tbl_tgeompoint3D_big WHERE temp -|- tgeompoint '[Point(1 1 1)@2000-01-01, Point(10 10 10)@2000-01-02]';

SELECT count(*) FROM tbl_tgeompoint3D_big WHERE temp << geometry 'Linestring(1 1 1,10 10 10)';
SELECT count(*) FROM tbl_tgeompoint3D_big WHERE temp &< geometry 'Linestring(1 1 1,10 10 10)';
SELECT count(*) FROM tbl_tgeompoint3D_big WHERE temp >> geometry 'Linestring(1 1 1,10 10 10)';
SELECT count(*) FROM tbl_tgeompoint3D_big WHERE temp &> geometry 'Linestring(1 1 1,10 10 10)';
SELECT count(*) FROM tbl_tgeompoint3D_big WHERE temp <<| geometry 'Linestring(1 1 1,10 10 10)';
SELECT count(*) FROM tbl_tgeompoint3D_big WHERE temp &<| geometry 'Linestring(1 1 1,10 10 10)';
SELECT count(*) FROM tbl_tgeompoint3D_big WHERE temp |>> geometry 'Linestring(1 1 1,10 10 10)';
SELECT count(*) FROM tbl_tgeompoint3D_big WHERE temp |&> geometry 'Linestring(1 1 1,10 10 10)';
SELECT count(*) FROM tbl_tgeompoint3D_big WHERE temp <</ geometry 'Linestring(1 1 1,10 10 10)';
SELECT count(*) FROM tbl_tgeompoint3D_big WHERE temp &</ geometry 'Linestring(1 1 1,10 10 10)';
SELECT count(*) FROM tbl_tgeompoint3D_big WHERE temp />> geometry 'Linestring(1 1 1,10 10 10)';
SELECT count(*) FROM tbl_tgeompoint3D_big WHERE temp /&> geometry 'Linestring(1 1 1,10 10 10)';
SELECT count(*) FROM tbl_tgeompoint3D_big WHERE temp |&> geometry 'Linestring(1 1 1,10 10 10)';

SELECT count(*) FROM tbl_tgeompoint3D_big WHERE temp <<# period '[2001-01-01, 2001-02-01]';
SELECT count(*) FROM tbl_tgeompoint3D_big WHERE temp &<# period '[2001-01-01, 2001-02-01]';
SELECT count(*) FROM tbl_tgeompoint3D_big WHERE temp #>> period '[2001-01-01, 2001-02-01]';
SELECT count(*) FROM tbl_tgeompoint3D_big WHERE temp #&> period '[2001-01-01, 2001-02-01]';

SELECT count(*) FROM tbl_tgeompoint3D_big WHERE temp << tgeompoint '[Point(1 1 1)@2000-01-01, Point(10 10 10)@2000-01-02]';
SELECT count(*) FROM tbl_tgeompoint3D_big WHERE temp &< tgeompoint '[Point(1 1 1)@2000-01-01, Point(10 10 10)@2000-01-02]';
SELECT count(*) FROM tbl_tgeompoint3D_big WHERE temp >> tgeompoint '[Point(1 1 1)@2000-01-01, Point(10 10 10)@2000-01-02]';
SELECT count(*) FROM tbl_tgeompoint3D_big WHERE temp &> tgeompoint '[Point(1 1 1)@2000-01-01, Point(10 10 10)@2000-01-02]';
SELECT count(*) FROM tbl_tgeompoint3D_big WHERE temp <<| tgeompoint '[Point(1 1 1)@2000-01-01, Point(10 10 10)@2000-01-02]';
SELECT count(*) FROM tbl_tgeompoint3D_big WHERE temp &<| tgeompoint '[Point(1 1 1)@2000-01-01, Point(10 10 10)@2000-01-02]';
SELECT count(*) FROM tbl_tgeompoint3D_big WHERE temp |>> tgeompoint '[Point(1 1 1)@2000-01-01, Point(10 10 10)@2000-01-02]';
SELECT count(*) FROM tbl_tgeompoint3D_big WHERE temp |&> tgeompoint '[Point(1 1 1)@2000-01-01, Point(10 10 10)@2000-01-02]';
SELECT count(*) FROM tbl_tgeompoint3D_big WHERE temp <</ tgeompoint '[Point(1 1 1)@2000-01-01, Point(10 10 10)@2000-01-02]';
SELECT count(*) FROM tbl_tgeompoint3D_big WHERE temp &</ tgeompoint '[Point(1 1 1)@2000-01-01, Point(10 10 10)@2000-01-02]';
SELECT count(*) FROM tbl_tgeompoint3D_big WHERE temp />> tgeompoint '[Point(1 1 1)@2000-01-01, Point(10 10 10)@2000-01-02]';
SELECT count(*) FROM tbl_tgeompoint3D_big WHERE temp /&> tgeompoint '[Point(1 1 1)@2000-01-01, Point(10 10 10)@2000-01-02]';
SELECT count(*) FROM tbl_tgeompoint3D_big WHERE temp |&> tgeompoint '[Point(1 1 1)@2000-01-01, Point(10 10 10)@2000-01-02]';
SELECT count(*) FROM tbl_tgeompoint3D_big WHERE temp <<# tgeompoint '[Point(1 1 1)@2000-01-01, Point(10 10 10)@2000-01-02]';
SELECT count(*) FROM tbl_tgeompoint3D_big WHERE temp &<# tgeompoint '[Point(1 1 1)@2000-01-01, Point(10 10 10)@2000-01-02]';
SELECT count(*) FROM tbl_tgeompoint3D_big WHERE temp #>> tgeompoint '[Point(1 1 1)@2000-01-01, Point(10 10 10)@2000-01-02]';
SELECT count(*) FROM tbl_tgeompoint3D_big WHERE temp #&> tgeompoint '[Point(1 1 1)@2000-01-01, Point(10 10 10)@2000-01-02]';

SELECT count(*) FROM tbl_tgeogpoint3D_big WHERE temp && geography 'Linestring(1 1 1,10 10 10)';
SELECT count(*) FROM tbl_tgeogpoint3D_big WHERE temp @> geography 'Linestring(1 1 1,10 10 10)';
SELECT count(*) FROM tbl_tgeogpoint3D_big WHERE temp <@ geography 'Linestring(1 1 1,10 10 10)';
SELECT count(*) FROM tbl_tgeogpoint3D_big WHERE temp ~= geography 'Linestring(1 1 1,10 10 10)';
SELECT count(*) FROM tbl_tgeogpoint3D_big WHERE temp -|- geography 'Linestring(1 1 1,10 10 10)';

SELECT count(*) FROM tbl_tgeogpoint3D_big WHERE temp <<# period '[2001-01-01, 2001-02-01]';
SELECT count(*) FROM tbl_tgeogpoint3D_big WHERE temp &<# period '[2001-01-01, 2001-02-01]';
SELECT count(*) FROM tbl_tgeogpoint3D_big WHERE temp #>> period '[2001-01-01, 2001-02-01]';
SELECT count(*) FROM tbl_tgeogpoint3D_big WHERE temp #&> period '[2001-01-01, 2001-02-01]';

SELECT count(*) FROM tbl_tgeogpoint3D_big WHERE temp && tgeogpoint '[Point(1 1 1)@2000-01-01, Point(10 10 10)@2000-01-02]';
SELECT count(*) FROM tbl_tgeogpoint3D_big WHERE temp @> tgeogpoint '[Point(1 1 1)@2000-01-01, Point(10 10 10)@2000-01-02]';
SELECT count(*) FROM tbl_tgeogpoint3D_big WHERE temp <@ tgeogpoint '[Point(1 1 1)@2000-01-01, Point(10 10 10)@2000-01-02]';
SELECT count(*) FROM tbl_tgeogpoint3D_big WHERE temp ~= tgeogpoint '[Point(1 1 1)@2000-01-01, Point(10 10 10)@2000-01-02]';
SELECT count(*) FROM tbl_tgeogpoint3D_big WHERE temp -|- tgeogpoint '[Point(1 1 1)@2000-01-01, Point(10 10 10)@2000-01-02]';
SELECT count(*) FROM tbl_tgeogpoint3D_big WHERE temp <<# tgeogpoint '[Point(1 1 1)@2000-01-01, Point(10 10 10)@2000-01-02]';
SELECT count(*) FROM tbl_tgeogpoint3D_big WHERE temp &<# tgeogpoint '[Point(1 1 1)@2000-01-01, Point(10 10 10)@2000-01-02]';
SELECT count(*) FROM tbl_tgeogpoint3D_big WHERE temp #>> tgeogpoint '[Point(1 1 1)@2000-01-01, Point(10 10 10)@2000-01-02]';
SELECT count(*) FROM tbl_tgeogpoint3D_big WHERE temp #&> tgeogpoint '[Point(1 1 1)@2000-01-01, Point(10 10 10)@2000-01-02]';

DROP INDEX IF EXISTS tbl_tgeompoint3D_big_spgist_idx;
DROP INDEX IF EXISTS tbl_tgeogpoint3D_big_spgist_idx;

-------------------------------------------------------------------------------
