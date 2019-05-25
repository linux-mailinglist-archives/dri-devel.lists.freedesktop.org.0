Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDE02A71B
	for <lists+dri-devel@lfdr.de>; Sat, 25 May 2019 23:18:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE2836E186;
	Sat, 25 May 2019 21:18:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4CE696E188
 for <dri-devel@lists.freedesktop.org>; Sat, 25 May 2019 21:18:43 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 4979772167; Sat, 25 May 2019 21:18:43 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109239] Polaris10: Periodic random black screens for 1-2 seconds
Date: Sat, 25 May 2019 21:18:43 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rocketraman@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109239-502-6yzWeTeq0f@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109239-502@http.bugs.freedesktop.org/>
References: <bug-109239-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2045830611=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2045830611==
Content-Type: multipart/alternative; boundary="15588191233.A0ae1.30410"
Content-Transfer-Encoding: 7bit


--15588191233.A0ae1.30410
Date: Sat, 25 May 2019 21:18:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109239

--- Comment #13 from Raman Gupta <rocketraman@gmail.com> ---
Still having this problem with newer software:

Linux edison 5.0.16-200.fc29.x86_64 #1 SMP Tue May 14 18:27:35 UTC 2019 x86=
_64
x86_64 x86_64 GNU/Linux

Mesa 18.3.6-3.fc29

It seems to happen more often when using Google Hangouts, with video turned=
 on.
However, it does not happen more often when watching YouTube videos.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15588191233.A0ae1.30410
Date: Sat, 25 May 2019 21:18:43 +0000
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
   title=3D"NEW - Polaris10: Periodic random black screens for 1-2 seconds"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109239#c13">Comme=
nt # 13</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Polaris10: Periodic random black screens for 1-2 seconds"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109239">bug 10923=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rocketraman&#64;gmail.com" title=3D"Raman Gupta &lt;rocketraman&#64;gmail.c=
om&gt;"> <span class=3D"fn">Raman Gupta</span></a>
</span></b>
        <pre>Still having this problem with newer software:

Linux edison 5.0.16-200.fc29.x86_64 #1 SMP Tue May 14 18:27:35 UTC 2019 x86=
_64
x86_64 x86_64 GNU/Linux

Mesa 18.3.6-3.fc29

It seems to happen more often when using Google Hangouts, with video turned=
 on.
However, it does not happen more often when watching YouTube videos.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15588191233.A0ae1.30410--

--===============2045830611==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2045830611==--
