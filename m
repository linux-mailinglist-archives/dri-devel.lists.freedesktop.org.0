Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD69EEAE9
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 22:16:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6232B6E893;
	Mon,  4 Nov 2019 21:16:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id D893E6E889
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 21:16:50 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id D5176720E2; Mon,  4 Nov 2019 21:16:50 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Mon, 04 Nov 2019 21:16:51 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: danielsuarez369@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: highest
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-tcaC8eGDZ5@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111481-502@http.bugs.freedesktop.org/>
References: <bug-111481-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0650199009=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0650199009==
Content-Type: multipart/alternative; boundary="15729022101.58ECCE2.2871"
Content-Transfer-Encoding: 7bit


--15729022101.58ECCE2.2871
Date: Mon, 4 Nov 2019 21:16:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #204 from Daniel Suarez <danielsuarez369@protonmail.com> ---
(In reply to Marko Popovic from comment #202)
> (In reply to Daniel Suarez from comment #201)
> > AMD has been pretty quiet here lately, has anyone tested with the 6th
> > release candidate for kernel 5.4? AMD was present in the changelogs and=
 they
> > did some SDMA improvements, some mentioning that it fixes some freezes
>=20
> Last trace that I posted is done on 5.4 RC6 and MESA git...

My bad I missed that.=20

Shame, AMD really needs to get it together

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15729022101.58ECCE2.2871
Date: Mon, 4 Nov 2019 21:16:50 +0000
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
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c204">Comm=
ent # 204</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
danielsuarez369&#64;protonmail.com" title=3D"Daniel Suarez &lt;danielsuarez=
369&#64;protonmail.com&gt;"> <span class=3D"fn">Daniel Suarez</span></a>
</span></b>
        <pre>(In reply to Marko Popovic from <a href=3D"show_bug.cgi?id=3D1=
11481#c202">comment #202</a>)
<span class=3D"quote">&gt; (In reply to Daniel Suarez from <a href=3D"show_=
bug.cgi?id=3D111481#c201">comment #201</a>)
&gt; &gt; AMD has been pretty quiet here lately, has anyone tested with the=
 6th
&gt; &gt; release candidate for kernel 5.4? AMD was present in the changelo=
gs and they
&gt; &gt; did some SDMA improvements, some mentioning that it fixes some fr=
eezes
&gt;=20
&gt; Last trace that I posted is done on 5.4 RC6 and MESA git...</span >

My bad I missed that.=20

Shame, AMD really needs to get it together</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15729022101.58ECCE2.2871--

--===============0650199009==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0650199009==--
