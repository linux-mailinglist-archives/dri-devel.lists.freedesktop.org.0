Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD49F68F6
	for <lists+dri-devel@lfdr.de>; Sun, 10 Nov 2019 13:42:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63B336E622;
	Sun, 10 Nov 2019 12:42:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 32DAA6E61F
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Nov 2019 12:42:55 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 2FD89720E2; Sun, 10 Nov 2019 12:42:55 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Sun, 10 Nov 2019 12:42:54 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: somigiv255@iwebtm.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: highest
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-aDCrdvH5hU@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2101151703=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2101151703==
Content-Type: multipart/alternative; boundary="15733897752.6cBA6Ef.4808"
Content-Transfer-Encoding: 7bit


--15733897752.6cBA6Ef.4808
Date: Sun, 10 Nov 2019 12:42:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #225 from John Smith <somigiv255@iwebtm.com> ---
(In reply to Pierre-Eric Pelloux-Prayer from comment #141)

> For radeonsi the AMD_DEBUG=3Dnodma environment variable is a workaround u=
ntil
> we figure out a proper fix.

Is this seriously what AMD calls "support"? No offense but this is ridiculo=
us,
this card has been out for four months and it still can't even browse firef=
ox
reliably, even after these "workarounds" and "patches".=20

Then we waited two months for the drivers to even get properly released, and
all this wait was for nothing because the drivers are useless, you can't ev=
en
browse firefox or let alone play any actual games. What is the point of hav=
ing
open source drivers if they don't even work? Nvidia's GPUs have had day one
support, and unlike AMD, "support" actually means the GPU works for somethi=
ng
that is meaningful.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15733897752.6cBA6Ef.4808
Date: Sun, 10 Nov 2019 12:42:55 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c225">Comm=
ent # 225</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
somigiv255&#64;iwebtm.com" title=3D"John Smith &lt;somigiv255&#64;iwebtm.co=
m&gt;"> <span class=3D"fn">John Smith</span></a>
</span></b>
        <pre>(In reply to Pierre-Eric Pelloux-Prayer from <a href=3D"show_b=
ug.cgi?id=3D111481#c141">comment #141</a>)

<span class=3D"quote">&gt; For radeonsi the AMD_DEBUG=3Dnodma environment v=
ariable is a workaround until
&gt; we figure out a proper fix.</span >

Is this seriously what AMD calls &quot;support&quot;? No offense but this i=
s ridiculous,
this card has been out for four months and it still can't even browse firef=
ox
reliably, even after these &quot;workarounds&quot; and &quot;patches&quot;.=
=20

Then we waited two months for the drivers to even get properly released, and
all this wait was for nothing because the drivers are useless, you can't ev=
en
browse firefox or let alone play any actual games. What is the point of hav=
ing
open source drivers if they don't even work? Nvidia's GPUs have had day one
support, and unlike AMD, &quot;support&quot; actually means the GPU works f=
or something
that is meaningful.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15733897752.6cBA6Ef.4808--

--===============2101151703==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2101151703==--
