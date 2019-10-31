Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86115EAFBF
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 13:00:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFA306EE70;
	Thu, 31 Oct 2019 12:00:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5D6096EE5C
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 12:00:10 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 56396720E2; Thu, 31 Oct 2019 12:00:10 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Thu, 31 Oct 2019 12:00:10 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: wychuchol7777@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: highest
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-AI167piYoU@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0092659913=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0092659913==
Content-Type: multipart/alternative; boundary="15725232100.DdAE.12813"
Content-Transfer-Encoding: 7bit


--15725232100.DdAE.12813
Date: Thu, 31 Oct 2019 12:00:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #185 from wychuchol <wychuchol7777@gmail.com> ---
I wrote a nice long post but for some reason my browser decided to refresh =
so
it got dunked...

Anyways long story short:

RX 5700 XT, Pop OS 19.10, latest Oibaf mesa, I don't know how to check llvm
version cause search engine gave me no answer but it's probably whatever got
installed using this guide and updated:=20
https://ubuntuforums.org/showthread.php?t=3D2425799

DDLC with Monika's After Story mod running natively
Oct 31 11:52:34 pop-os kernel: [  129.130712]
[drm:amdgpu_dm_commit_planes.constprop.0 [amdgpu]] *ERROR* Waiting for fenc=
es
timed out!
Oct 31 11:52:34 pop-os kernel: [  133.994710] [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* ring sdma0 timeout, signaled seq=3D17012, emitted seq=3D1=
7014
Oct 31 11:52:34 pop-os kernel: [  133.994747] [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* Process information: process DDLC pid 3150 thread DDLC:cs0
pid 3168
Oct 31 11:52:34 pop-os kernel: [  133.994748] [drm] GPU recovery disabled.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15725232100.DdAE.12813
Date: Thu, 31 Oct 2019 12:00:10 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c185">Comm=
ent # 185</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
wychuchol7777&#64;gmail.com" title=3D"wychuchol &lt;wychuchol7777&#64;gmail=
.com&gt;"> <span class=3D"fn">wychuchol</span></a>
</span></b>
        <pre>I wrote a nice long post but for some reason my browser decide=
d to refresh so
it got dunked...

Anyways long story short:

RX 5700 XT, Pop OS 19.10, latest Oibaf mesa, I don't know how to check llvm
version cause search engine gave me no answer but it's probably whatever got
installed using this guide and updated:=20
<a href=3D"https://ubuntuforums.org/showthread.php?t=3D2425799">https://ubu=
ntuforums.org/showthread.php?t=3D2425799</a>

DDLC with Monika's After Story mod running natively
Oct 31 11:52:34 pop-os kernel: [  129.130712]
[drm:amdgpu_dm_commit_planes.constprop.0 [amdgpu]] *ERROR* Waiting for fenc=
es
timed out!
Oct 31 11:52:34 pop-os kernel: [  133.994710] [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* ring sdma0 timeout, signaled seq=3D17012, emitted seq=3D1=
7014
Oct 31 11:52:34 pop-os kernel: [  133.994747] [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* Process information: process DDLC pid 3150 thread DDLC:cs0
pid 3168
Oct 31 11:52:34 pop-os kernel: [  133.994748] [drm] GPU recovery disabled.<=
/pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15725232100.DdAE.12813--

--===============0092659913==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0092659913==--
