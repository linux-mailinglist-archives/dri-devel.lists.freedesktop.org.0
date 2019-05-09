Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8767C18BA6
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 16:23:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E18089C9D;
	Thu,  9 May 2019 14:23:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7E26C89C9D
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2019 14:23:44 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 749AE7215A; Thu,  9 May 2019 14:23:44 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 108898] (Recoverable) GPU hangs with GfxBench Manhattan GL tests
Date: Thu, 09 May 2019 14:23:44 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: eero.t.tamminen@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-108898-502-NlT2ZleQzI@http.bugs.freedesktop.org/>
In-Reply-To: <bug-108898-502@http.bugs.freedesktop.org/>
References: <bug-108898-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0848155994=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0848155994==
Content-Type: multipart/alternative; boundary="15574118240.6D61EEb4.22270"
Content-Transfer-Encoding: 7bit


--15574118240.6D61EEb4.22270
Date: Thu, 9 May 2019 14:23:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108898

--- Comment #4 from Eero Tamminen <eero.t.tamminen@intel.com> ---
Any updates on this (VegaM) bug?  These recoverable hangs are still happeni=
ng
with git versions of kernel, Mesa and linux-firmware. Unlike with the hard =
hang
bug 108900, this test-case is freely available.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15574118240.6D61EEb4.22270
Date: Thu, 9 May 2019 14:23:44 +0000
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
   title=3D"NEW - (Recoverable) GPU hangs with GfxBench Manhattan GL tests"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108898#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - (Recoverable) GPU hangs with GfxBench Manhattan GL tests"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108898">bug 10889=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
eero.t.tamminen&#64;intel.com" title=3D"Eero Tamminen &lt;eero.t.tamminen&#=
64;intel.com&gt;"> <span class=3D"fn">Eero Tamminen</span></a>
</span></b>
        <pre>Any updates on this (VegaM) bug?  These recoverable hangs are =
still happening
with git versions of kernel, Mesa and linux-firmware. Unlike with the hard =
hang
<a class=3D"bz_bug_link=20
          bz_status_VERIFIED  bz_closed"
   title=3D"VERIFIED WONTFIX - [KBL-G][Vulkan] Non-recoverable GPU hangs wi=
th GfxBench v5 Aztec Ruins Vulkan test"
   href=3D"show_bug.cgi?id=3D108900">bug 108900</a>, this test-case is free=
ly available.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15574118240.6D61EEb4.22270--

--===============0848155994==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0848155994==--
