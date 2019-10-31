Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1134BEB55B
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 17:51:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 395CD6EAD7;
	Thu, 31 Oct 2019 16:51:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0AF966EAD7
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 16:51:08 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 07140720E2; Thu, 31 Oct 2019 16:51:08 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112188] OpenGL stuttering in some cases on AMD Navi cards (RX
 5700XT in my case)
Date: Thu, 31 Oct 2019 16:51:08 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: popovic.marko@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-112188-502-QKpjolK5mz@http.bugs.freedesktop.org/>
In-Reply-To: <bug-112188-502@http.bugs.freedesktop.org/>
References: <bug-112188-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0056014432=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0056014432==
Content-Type: multipart/alternative; boundary="15725406671.BF24BfA2.12863"
Content-Transfer-Encoding: 7bit


--15725406671.BF24BfA2.12863
Date: Thu, 31 Oct 2019 16:51:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112188

--- Comment #4 from Marko Popovic <popovic.marko@protonmail.com> ---
I just spoke to another user that has different model of the RX 5700 XT and=
 he
doesn't seem to be having this issue.

My setup:
OS: Pop!_OS 19.10
CPU/RAM: Intel i5-6600 / 16 GB DDR4
GPU: Sapphire Pulse RX 5700 XT
Kernel: 5.4.0-999-generic (Ubuntu daily)
MESA: OpenGL version string: 4.5 (Compatibility Profile) Mesa 19.3.0-devel
(git-ff6e148 2019-10-29 eoan-oibaf-ppa)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15725406671.BF24BfA2.12863
Date: Thu, 31 Oct 2019 16:51:07 +0000
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
   title=3D"NEW - OpenGL stuttering in some cases on AMD Navi cards (RX 570=
0XT in my case)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112188#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - OpenGL stuttering in some cases on AMD Navi cards (RX 570=
0XT in my case)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112188">bug 11218=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
popovic.marko&#64;protonmail.com" title=3D"Marko Popovic &lt;popovic.marko&=
#64;protonmail.com&gt;"> <span class=3D"fn">Marko Popovic</span></a>
</span></b>
        <pre>I just spoke to another user that has different model of the R=
X 5700 XT and he
doesn't seem to be having this issue.

My setup:
OS: Pop!_OS 19.10
CPU/RAM: Intel i5-6600 / 16 GB DDR4
GPU: Sapphire Pulse RX 5700 XT
Kernel: 5.4.0-999-generic (Ubuntu daily)
MESA: OpenGL version string: 4.5 (Compatibility Profile) Mesa 19.3.0-devel
(git-ff6e148 2019-10-29 eoan-oibaf-ppa)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15725406671.BF24BfA2.12863--

--===============0056014432==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0056014432==--
