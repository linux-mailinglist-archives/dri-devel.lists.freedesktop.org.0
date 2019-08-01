Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 631777D224
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 02:00:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 660446E315;
	Thu,  1 Aug 2019 00:00:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id D21726E315
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 00:00:26 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id CECC072168; Thu,  1 Aug 2019 00:00:26 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110961] Are provided libdrm packages completely open source?
Date: Thu, 01 Aug 2019 00:00:27 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu-pro
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: ashark@linuxcomp.ru
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: WORKSFORME
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110961-502-Oxi9H94jMu@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110961-502@http.bugs.freedesktop.org/>
References: <bug-110961-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1536504551=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1536504551==
Content-Type: multipart/alternative; boundary="15646176261.05a127.10061"
Content-Transfer-Encoding: 7bit


--15646176261.05a127.10061
Date: Thu, 1 Aug 2019 00:00:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110961

--- Comment #6 from Andrew Shark <ashark@linuxcomp.ru> ---
Hi, Jeremy.
The reason I am porting pro stack to arch Linux is that I want to be able to
launch Davinci Resolve. It is proprietary software for video editing.
It requires pro OpenCL and pro OpenGL. At least for now. I do not know why
exactly it crashes with open source OpenGL driver with AMD gpu renderer.
Probably version of OpenGL or some extensions.

Is there a chance that open source OpenGL driver for AMD gpu would satisfy
Davinci Resolve's requirements?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15646176261.05a127.10061
Date: Thu, 1 Aug 2019 00:00:26 +0000
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
   title=3D"RESOLVED WORKSFORME - Are provided libdrm packages completely o=
pen source?"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110961#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED WORKSFORME - Are provided libdrm packages completely o=
pen source?"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110961">bug 11096=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ashark&#64;linuxcomp.ru" title=3D"Andrew Shark &lt;ashark&#64;linuxcomp.ru&=
gt;"> <span class=3D"fn">Andrew Shark</span></a>
</span></b>
        <pre>Hi, Jeremy.
The reason I am porting pro stack to arch Linux is that I want to be able to
launch Davinci Resolve. It is proprietary software for video editing.
It requires pro OpenCL and pro OpenGL. At least for now. I do not know why
exactly it crashes with open source OpenGL driver with AMD gpu renderer.
Probably version of OpenGL or some extensions.

Is there a chance that open source OpenGL driver for AMD gpu would satisfy
Davinci Resolve's requirements?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15646176261.05a127.10061--

--===============1536504551==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1536504551==--
