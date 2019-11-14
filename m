Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E45FBD24
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 01:44:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD146EEC0;
	Thu, 14 Nov 2019 00:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id C62D96EEB5
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 00:44:12 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id BBF19720E2; Thu, 14 Nov 2019 00:44:12 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Thu, 14 Nov 2019 00:44:12 +0000
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
Message-ID: <bug-111481-502-IyMxNJw3i4@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1548482143=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1548482143==
Content-Type: multipart/alternative; boundary="15736922522.A3EeFd.22103"
Content-Transfer-Encoding: 7bit


--15736922522.A3EeFd.22103
Date: Thu, 14 Nov 2019 00:44:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #230 from Daniel Suarez <danielsuarez369@protonmail.com> ---
(In reply to John Smith from comment #225)
> (In reply to Pierre-Eric Pelloux-Prayer from comment #141)
>=20
> > For radeonsi the AMD_DEBUG=3Dnodma environment variable is a workaround=
 until
> > we figure out a proper fix.
>=20
> Is this seriously what AMD calls "support"? No offense but this is
> ridiculous, this card has been out for four months and it still can't even
> browse firefox reliably, even after these "workarounds" and "patches".=20
>=20
> Then we waited two months for the drivers to even get properly released, =
and
> all this wait was for nothing because the drivers are useless, you can't
> even browse firefox or let alone play any actual games. What is the point=
 of
> having open source drivers if they don't even work? Nvidia's GPUs have had
> day one support, and unlike AMD, "support" actually means the GPU works f=
or
> something that is meaningful.

I wouldn't really call what is happening here "support". Really feels like =
us
Linux users were thrown to the side with little consideration.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15736922522.A3EeFd.22103
Date: Thu, 14 Nov 2019 00:44:12 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c230">Comm=
ent # 230</a>
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
        <pre>(In reply to John Smith from <a href=3D"show_bug.cgi?id=3D1114=
81#c225">comment #225</a>)
<span class=3D"quote">&gt; (In reply to Pierre-Eric Pelloux-Prayer from <a =
href=3D"show_bug.cgi?id=3D111481#c141">comment #141</a>)
&gt;=20
&gt; &gt; For radeonsi the AMD_DEBUG=3Dnodma environment variable is a work=
around until
&gt; &gt; we figure out a proper fix.
&gt;=20
&gt; Is this seriously what AMD calls &quot;support&quot;? No offense but t=
his is
&gt; ridiculous, this card has been out for four months and it still can't =
even
&gt; browse firefox reliably, even after these &quot;workarounds&quot; and =
&quot;patches&quot;.=20
&gt;=20
&gt; Then we waited two months for the drivers to even get properly release=
d, and
&gt; all this wait was for nothing because the drivers are useless, you can=
't
&gt; even browse firefox or let alone play any actual games. What is the po=
int of
&gt; having open source drivers if they don't even work? Nvidia's GPUs have=
 had
&gt; day one support, and unlike AMD, &quot;support&quot; actually means th=
e GPU works for
&gt; something that is meaningful.</span >

I wouldn't really call what is happening here &quot;support&quot;. Really f=
eels like us
Linux users were thrown to the side with little consideration.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15736922522.A3EeFd.22103--

--===============1548482143==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1548482143==--
