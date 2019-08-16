Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81225909CB
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 22:57:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 624746E3AA;
	Fri, 16 Aug 2019 20:57:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id C2FA66E30C
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 20:57:08 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B617B721AA; Fri, 16 Aug 2019 20:57:08 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 102646] Screen flickering under amdgpu-experimental [buggy auto
 power profile]
Date: Fri, 16 Aug 2019 20:57:08 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: magist3r@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-102646-502-aA7IpK16n0@http.bugs.freedesktop.org/>
In-Reply-To: <bug-102646-502@http.bugs.freedesktop.org/>
References: <bug-102646-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0922556180=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0922556180==
Content-Type: multipart/alternative; boundary="15659890281.330a3C46c.13683"
Content-Transfer-Encoding: 7bit


--15659890281.330a3C46c.13683
Date: Fri, 16 Aug 2019 20:57:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102646

--- Comment #105 from magist3r <magist3r@gmail.com> ---
(In reply to reject5514 from comment #103)
> I have this problem on Archlinux 5.2.8-arch1-1-ARCH when connected 2
> monitors(1920x1080 @ 60Hz) and amdgpu.ppfeaturemask=3D0xffffffff option
> enabled. Patch didn't work for me.
>=20
> My GPU is RX570.

Try this patch:
https://lists.freedesktop.org/archives/amd-gfx/2019-June/036022.html

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15659890281.330a3C46c.13683
Date: Fri, 16 Aug 2019 20:57:08 +0000
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
   title=3D"NEW - Screen flickering under amdgpu-experimental [buggy auto p=
ower profile]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102646#c105">Comm=
ent # 105</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Screen flickering under amdgpu-experimental [buggy auto p=
ower profile]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102646">bug 10264=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
magist3r&#64;gmail.com" title=3D"magist3r &lt;magist3r&#64;gmail.com&gt;"> =
<span class=3D"fn">magist3r</span></a>
</span></b>
        <pre>(In reply to reject5514 from <a href=3D"show_bug.cgi?id=3D1026=
46#c103">comment #103</a>)
<span class=3D"quote">&gt; I have this problem on Archlinux 5.2.8-arch1-1-A=
RCH when connected 2
&gt; monitors(1920x1080 &#64; 60Hz) and amdgpu.ppfeaturemask=3D0xffffffff o=
ption
&gt; enabled. Patch didn't work for me.
&gt;=20
&gt; My GPU is RX570.</span >

Try this patch:
<a href=3D"https://lists.freedesktop.org/archives/amd-gfx/2019-June/036022.=
html">https://lists.freedesktop.org/archives/amd-gfx/2019-June/036022.html<=
/a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15659890281.330a3C46c.13683--

--===============0922556180==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0922556180==--
