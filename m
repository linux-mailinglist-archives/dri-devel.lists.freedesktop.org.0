Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7C8387E5
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 12:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A7EA89D46;
	Fri,  7 Jun 2019 10:27:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id ED3F789C89
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 10:26:58 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id DE4A072167; Fri,  7 Jun 2019 10:26:58 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110725] [CI][SHARDS]
 igt@kms_big_fb@(linear|x-tiled|y-tiled)-(16|32|64)bpp-rotate-(90|270) - skip
 - unsupported configuration, SKIP
Date: Fri, 07 Jun 2019 10:26:59 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: IGT
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: cibuglog@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: NOTABUG
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110725-502-NfYCHkHbMx@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110725-502@http.bugs.freedesktop.org/>
References: <bug-110725-502@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1071910527=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1071910527==
Content-Type: multipart/alternative; boundary="15599032180.045cBE6a5.16257"
Content-Transfer-Encoding: 7bit


--15599032180.045cBE6a5.16257
Date: Fri, 7 Jun 2019 10:26:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110725

--- Comment #10 from CI Bug Log <cibuglog@gmail.com> ---
A CI Bug Log filter associated to this bug has been updated:

{- CML ICL:
igt@kms_big_fb@(linear|x-tiled|y-tiled)-(16|32|64)bpp-rotate-(90|270) - ski=
p -
unsupported configuration, SKIP -}
{+ CML ICL:
igt@kms_big_fb@(linear|x-tiled|y-tiled)-(8|16|32|64)bpp-rotate-(90|270) - s=
kip
- unsupported configuration, SKIP +}

New failures caught by the filter:

  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-cml-u/igt@kms_big_fb=
@y-tiled-8bpp-rotate-90.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-cml-u/igt@kms_big_fb=
@y-tiled-8bpp-rotate-270.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-cml-u/igt@kms_big_fb=
@linear-8bpp-rotate-270.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-cml-u/igt@kms_big_fb=
@linear-8bpp-rotate-90.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-cml-u/igt@kms_big_fb=
@x-tiled-8bpp-rotate-90.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-cml-u2/igt@kms_big_f=
b@y-tiled-8bpp-rotate-270.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-cml-u2/igt@kms_big_f=
b@linear-8bpp-rotate-270.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-cml-u2/igt@kms_big_f=
b@x-tiled-8bpp-rotate-270.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-cml-u2/igt@kms_big_f=
b@linear-8bpp-rotate-90.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-cml-u2/igt@kms_big_f=
b@x-tiled-8bpp-rotate-90.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-icl-dsi/igt@kms_big_=
fb@linear-8bpp-rotate-270.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-icl-dsi/igt@kms_big_=
fb@x-tiled-8bpp-rotate-270.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-icl-dsi/igt@kms_big_=
fb@x-tiled-8bpp-rotate-90.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-icl-guc/igt@kms_big_=
fb@x-tiled-8bpp-rotate-270.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-icl-guc/igt@kms_big_=
fb@x-tiled-8bpp-rotate-90.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-icl-u2/igt@kms_big_f=
b@y-tiled-8bpp-rotate-90.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-icl-u2/igt@kms_big_f=
b@y-tiled-8bpp-rotate-270.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-icl-u2/igt@kms_big_f=
b@linear-8bpp-rotate-270.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-icl-u2/igt@kms_big_f=
b@linear-8bpp-rotate-90.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-icl-u2/igt@kms_big_f=
b@x-tiled-8bpp-rotate-90.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-icl-u3/igt@kms_big_f=
b@y-tiled-8bpp-rotate-90.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-icl-u3/igt@kms_big_f=
b@linear-8bpp-rotate-270.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-icl-u3/igt@kms_big_f=
b@linear-8bpp-rotate-90.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-icl-y/igt@kms_big_fb=
@y-tiled-8bpp-rotate-90.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-icl-y/igt@kms_big_fb=
@y-tiled-8bpp-rotate-270.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-icl-y/igt@kms_big_fb=
@linear-8bpp-rotate-270.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-icl-y/igt@kms_big_fb=
@x-tiled-8bpp-rotate-90.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5041/shard-iclb2/igt@kms_big_f=
b@x-tiled-8bpp-rotate-270.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5041/shard-iclb3/igt@kms_big_f=
b@linear-8bpp-rotate-90.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5041/shard-iclb3/igt@kms_big_f=
b@x-tiled-8bpp-rotate-90.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5041/shard-iclb4/igt@kms_big_f=
b@y-tiled-8bpp-rotate-90.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5041/shard-iclb8/igt@kms_big_f=
b@y-tiled-8bpp-rotate-270.html
  *
https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5041/shard-iclb8/igt@kms_big_f=
b@linear-8bpp-rotate-270.html

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15599032180.045cBE6a5.16257
Date: Fri, 7 Jun 2019 10:26:58 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED NOTABUG - [CI][SHARDS] igt&#64;kms_big_fb&#64;(linear|=
x-tiled|y-tiled)-(16|32|64)bpp-rotate-(90|270) - skip - unsupported configu=
ration, SKIP"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110725#c10">Comme=
nt # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED NOTABUG - [CI][SHARDS] igt&#64;kms_big_fb&#64;(linear|=
x-tiled|y-tiled)-(16|32|64)bpp-rotate-(90|270) - skip - unsupported configu=
ration, SKIP"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110725">bug 11072=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
cibuglog&#64;gmail.com" title=3D"CI Bug Log &lt;cibuglog&#64;gmail.com&gt;"=
> <span class=3D"fn">CI Bug Log</span></a>
</span></b>
        <pre>A CI Bug Log filter associated to this bug has been updated:

{- CML ICL:
igt&#64;kms_big_fb&#64;(linear|x-tiled|y-tiled)-(16|32|64)bpp-rotate-(90|27=
0) - skip -
unsupported configuration, SKIP -}
{+ CML ICL:
igt&#64;kms_big_fb&#64;(linear|x-tiled|y-tiled)-(8|16|32|64)bpp-rotate-(90|=
270) - skip
- unsupported configuration, SKIP +}

New failures caught by the filter:

  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-cml-u/igt=
&#64;kms_big_fb&#64;y-tiled-8bpp-rotate-90.html">https://intel-gfx-ci.01.or=
g/tree/drm-tip/drmtip_302/fi-cml-u/igt&#64;kms_big_fb&#64;y-tiled-8bpp-rota=
te-90.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-cml-u/igt=
&#64;kms_big_fb&#64;y-tiled-8bpp-rotate-270.html">https://intel-gfx-ci.01.o=
rg/tree/drm-tip/drmtip_302/fi-cml-u/igt&#64;kms_big_fb&#64;y-tiled-8bpp-rot=
ate-270.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-cml-u/igt=
&#64;kms_big_fb&#64;linear-8bpp-rotate-270.html">https://intel-gfx-ci.01.or=
g/tree/drm-tip/drmtip_302/fi-cml-u/igt&#64;kms_big_fb&#64;linear-8bpp-rotat=
e-270.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-cml-u/igt=
&#64;kms_big_fb&#64;linear-8bpp-rotate-90.html">https://intel-gfx-ci.01.org=
/tree/drm-tip/drmtip_302/fi-cml-u/igt&#64;kms_big_fb&#64;linear-8bpp-rotate=
-90.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-cml-u/igt=
&#64;kms_big_fb&#64;x-tiled-8bpp-rotate-90.html">https://intel-gfx-ci.01.or=
g/tree/drm-tip/drmtip_302/fi-cml-u/igt&#64;kms_big_fb&#64;x-tiled-8bpp-rota=
te-90.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-cml-u2/ig=
t&#64;kms_big_fb&#64;y-tiled-8bpp-rotate-270.html">https://intel-gfx-ci.01.=
org/tree/drm-tip/drmtip_302/fi-cml-u2/igt&#64;kms_big_fb&#64;y-tiled-8bpp-r=
otate-270.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-cml-u2/ig=
t&#64;kms_big_fb&#64;linear-8bpp-rotate-270.html">https://intel-gfx-ci.01.o=
rg/tree/drm-tip/drmtip_302/fi-cml-u2/igt&#64;kms_big_fb&#64;linear-8bpp-rot=
ate-270.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-cml-u2/ig=
t&#64;kms_big_fb&#64;x-tiled-8bpp-rotate-270.html">https://intel-gfx-ci.01.=
org/tree/drm-tip/drmtip_302/fi-cml-u2/igt&#64;kms_big_fb&#64;x-tiled-8bpp-r=
otate-270.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-cml-u2/ig=
t&#64;kms_big_fb&#64;linear-8bpp-rotate-90.html">https://intel-gfx-ci.01.or=
g/tree/drm-tip/drmtip_302/fi-cml-u2/igt&#64;kms_big_fb&#64;linear-8bpp-rota=
te-90.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-cml-u2/ig=
t&#64;kms_big_fb&#64;x-tiled-8bpp-rotate-90.html">https://intel-gfx-ci.01.o=
rg/tree/drm-tip/drmtip_302/fi-cml-u2/igt&#64;kms_big_fb&#64;x-tiled-8bpp-ro=
tate-90.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-icl-dsi/i=
gt&#64;kms_big_fb&#64;linear-8bpp-rotate-270.html">https://intel-gfx-ci.01.=
org/tree/drm-tip/drmtip_302/fi-icl-dsi/igt&#64;kms_big_fb&#64;linear-8bpp-r=
otate-270.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-icl-dsi/i=
gt&#64;kms_big_fb&#64;x-tiled-8bpp-rotate-270.html">https://intel-gfx-ci.01=
.org/tree/drm-tip/drmtip_302/fi-icl-dsi/igt&#64;kms_big_fb&#64;x-tiled-8bpp=
-rotate-270.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-icl-dsi/i=
gt&#64;kms_big_fb&#64;x-tiled-8bpp-rotate-90.html">https://intel-gfx-ci.01.=
org/tree/drm-tip/drmtip_302/fi-icl-dsi/igt&#64;kms_big_fb&#64;x-tiled-8bpp-=
rotate-90.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-icl-guc/i=
gt&#64;kms_big_fb&#64;x-tiled-8bpp-rotate-270.html">https://intel-gfx-ci.01=
.org/tree/drm-tip/drmtip_302/fi-icl-guc/igt&#64;kms_big_fb&#64;x-tiled-8bpp=
-rotate-270.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-icl-guc/i=
gt&#64;kms_big_fb&#64;x-tiled-8bpp-rotate-90.html">https://intel-gfx-ci.01.=
org/tree/drm-tip/drmtip_302/fi-icl-guc/igt&#64;kms_big_fb&#64;x-tiled-8bpp-=
rotate-90.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-icl-u2/ig=
t&#64;kms_big_fb&#64;y-tiled-8bpp-rotate-90.html">https://intel-gfx-ci.01.o=
rg/tree/drm-tip/drmtip_302/fi-icl-u2/igt&#64;kms_big_fb&#64;y-tiled-8bpp-ro=
tate-90.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-icl-u2/ig=
t&#64;kms_big_fb&#64;y-tiled-8bpp-rotate-270.html">https://intel-gfx-ci.01.=
org/tree/drm-tip/drmtip_302/fi-icl-u2/igt&#64;kms_big_fb&#64;y-tiled-8bpp-r=
otate-270.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-icl-u2/ig=
t&#64;kms_big_fb&#64;linear-8bpp-rotate-270.html">https://intel-gfx-ci.01.o=
rg/tree/drm-tip/drmtip_302/fi-icl-u2/igt&#64;kms_big_fb&#64;linear-8bpp-rot=
ate-270.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-icl-u2/ig=
t&#64;kms_big_fb&#64;linear-8bpp-rotate-90.html">https://intel-gfx-ci.01.or=
g/tree/drm-tip/drmtip_302/fi-icl-u2/igt&#64;kms_big_fb&#64;linear-8bpp-rota=
te-90.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-icl-u2/ig=
t&#64;kms_big_fb&#64;x-tiled-8bpp-rotate-90.html">https://intel-gfx-ci.01.o=
rg/tree/drm-tip/drmtip_302/fi-icl-u2/igt&#64;kms_big_fb&#64;x-tiled-8bpp-ro=
tate-90.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-icl-u3/ig=
t&#64;kms_big_fb&#64;y-tiled-8bpp-rotate-90.html">https://intel-gfx-ci.01.o=
rg/tree/drm-tip/drmtip_302/fi-icl-u3/igt&#64;kms_big_fb&#64;y-tiled-8bpp-ro=
tate-90.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-icl-u3/ig=
t&#64;kms_big_fb&#64;linear-8bpp-rotate-270.html">https://intel-gfx-ci.01.o=
rg/tree/drm-tip/drmtip_302/fi-icl-u3/igt&#64;kms_big_fb&#64;linear-8bpp-rot=
ate-270.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-icl-u3/ig=
t&#64;kms_big_fb&#64;linear-8bpp-rotate-90.html">https://intel-gfx-ci.01.or=
g/tree/drm-tip/drmtip_302/fi-icl-u3/igt&#64;kms_big_fb&#64;linear-8bpp-rota=
te-90.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-icl-y/igt=
&#64;kms_big_fb&#64;y-tiled-8bpp-rotate-90.html">https://intel-gfx-ci.01.or=
g/tree/drm-tip/drmtip_302/fi-icl-y/igt&#64;kms_big_fb&#64;y-tiled-8bpp-rota=
te-90.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-icl-y/igt=
&#64;kms_big_fb&#64;y-tiled-8bpp-rotate-270.html">https://intel-gfx-ci.01.o=
rg/tree/drm-tip/drmtip_302/fi-icl-y/igt&#64;kms_big_fb&#64;y-tiled-8bpp-rot=
ate-270.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-icl-y/igt=
&#64;kms_big_fb&#64;linear-8bpp-rotate-270.html">https://intel-gfx-ci.01.or=
g/tree/drm-tip/drmtip_302/fi-icl-y/igt&#64;kms_big_fb&#64;linear-8bpp-rotat=
e-270.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_302/fi-icl-y/igt=
&#64;kms_big_fb&#64;x-tiled-8bpp-rotate-90.html">https://intel-gfx-ci.01.or=
g/tree/drm-tip/drmtip_302/fi-icl-y/igt&#64;kms_big_fb&#64;x-tiled-8bpp-rota=
te-90.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5041/shard-iclb2/ig=
t&#64;kms_big_fb&#64;x-tiled-8bpp-rotate-270.html">https://intel-gfx-ci.01.=
org/tree/drm-tip/IGT_5041/shard-iclb2/igt&#64;kms_big_fb&#64;x-tiled-8bpp-r=
otate-270.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5041/shard-iclb3/ig=
t&#64;kms_big_fb&#64;linear-8bpp-rotate-90.html">https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGT_5041/shard-iclb3/igt&#64;kms_big_fb&#64;linear-8bpp-rota=
te-90.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5041/shard-iclb3/ig=
t&#64;kms_big_fb&#64;x-tiled-8bpp-rotate-90.html">https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGT_5041/shard-iclb3/igt&#64;kms_big_fb&#64;x-tiled-8bpp-ro=
tate-90.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5041/shard-iclb4/ig=
t&#64;kms_big_fb&#64;y-tiled-8bpp-rotate-90.html">https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGT_5041/shard-iclb4/igt&#64;kms_big_fb&#64;y-tiled-8bpp-ro=
tate-90.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5041/shard-iclb8/ig=
t&#64;kms_big_fb&#64;y-tiled-8bpp-rotate-270.html">https://intel-gfx-ci.01.=
org/tree/drm-tip/IGT_5041/shard-iclb8/igt&#64;kms_big_fb&#64;y-tiled-8bpp-r=
otate-270.html</a>
  *
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5041/shard-iclb8/ig=
t&#64;kms_big_fb&#64;linear-8bpp-rotate-270.html">https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGT_5041/shard-iclb8/igt&#64;kms_big_fb&#64;linear-8bpp-rot=
ate-270.html</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15599032180.045cBE6a5.16257--

--===============1071910527==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1071910527==--
