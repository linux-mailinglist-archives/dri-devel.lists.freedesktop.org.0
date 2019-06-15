Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DC54707C
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2019 16:43:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D083892BB;
	Sat, 15 Jun 2019 14:43:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id BBC44892BB
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2019 14:43:26 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B86A472167; Sat, 15 Jun 2019 14:43:26 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110866] Revert 8059add0478e29cb641936011a8fcc9ce9fd80be for
 stable 5.1.x
Date: Sat, 15 Jun 2019 14:43:26 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nrndda@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: FIXED
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-110866-502-wblAREKnKz@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110866-502@http.bugs.freedesktop.org/>
References: <bug-110866-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0900272663=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0900272663==
Content-Type: multipart/alternative; boundary="15606098061.75f8aDD.8990"
Content-Transfer-Encoding: 7bit


--15606098061.75f8aDD.8990
Date: Sat, 15 Jun 2019 14:43:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110866

Dmitry Derevyanko <nrndda@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #1 from Dmitry Derevyanko <nrndda@gmail.com> ---
In 5.1.10:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=
=3Dlinux-5.1.y&id=3Dc2d2804b9939402f6ac9514d049e4469b6e1cb5d
SteamVR works.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15606098061.75f8aDD.8990
Date: Sat, 15 Jun 2019 14:43:26 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:nrndda&#6=
4;gmail.com" title=3D"Dmitry Derevyanko &lt;nrndda&#64;gmail.com&gt;"> <spa=
n class=3D"fn">Dmitry Derevyanko</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Revert 8059add0478e29cb641936011a8fcc9ce9fd80b=
e for stable 5.1.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110866">bug 11086=
6</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>FIXED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Revert 8059add0478e29cb641936011a8fcc9ce9fd80b=
e for stable 5.1.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110866#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Revert 8059add0478e29cb641936011a8fcc9ce9fd80b=
e for stable 5.1.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110866">bug 11086=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
nrndda&#64;gmail.com" title=3D"Dmitry Derevyanko &lt;nrndda&#64;gmail.com&g=
t;"> <span class=3D"fn">Dmitry Derevyanko</span></a>
</span></b>
        <pre>In 5.1.10:
<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git=
/commit/?h=3Dlinux-5.1.y&amp;id=3Dc2d2804b9939402f6ac9514d049e4469b6e1cb5d"=
>https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=
=3Dlinux-5.1.y&amp;id=3Dc2d2804b9939402f6ac9514d049e4469b6e1cb5d</a>
SteamVR works.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15606098061.75f8aDD.8990--

--===============0900272663==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0900272663==--
