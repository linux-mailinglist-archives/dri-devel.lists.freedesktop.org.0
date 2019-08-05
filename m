Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC4181F22
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 16:30:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 663FD89D2E;
	Mon,  5 Aug 2019 14:30:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id E710189D2E
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 14:30:23 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id DEA7C72168; Mon,  5 Aug 2019 14:30:23 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111299] AMD RX 570 Black Screen/Hang at startup (AMDGpu DC
 problem)
Date: Mon, 05 Aug 2019 14:30:24 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: suren.karimp@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111299-502-bniX4HMbbo@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111299-502@http.bugs.freedesktop.org/>
References: <bug-111299-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2057484005=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2057484005==
Content-Type: multipart/alternative; boundary="15650154231.59EcbcFD6.14217"
Content-Transfer-Encoding: 7bit


--15650154231.59EcbcFD6.14217
Date: Mon, 5 Aug 2019 14:30:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111299

--- Comment #2 from Surena Karimpour <suren.karimp@gmail.com> ---
Its not possible to report without amdgpu.dc=3D0
Its absolutely impossible to boot the system, it tries to boot and then 'di=
es',
quite literally, as nothing functions on the system.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15650154231.59EcbcFD6.14217
Date: Mon, 5 Aug 2019 14:30:23 +0000
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
   title=3D"NEW - AMD RX 570 Black Screen/Hang at startup (AMDGpu DC proble=
m)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111299#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD RX 570 Black Screen/Hang at startup (AMDGpu DC proble=
m)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111299">bug 11129=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
suren.karimp&#64;gmail.com" title=3D"Surena Karimpour &lt;suren.karimp&#64;=
gmail.com&gt;"> <span class=3D"fn">Surena Karimpour</span></a>
</span></b>
        <pre>Its not possible to report without amdgpu.dc=3D0
Its absolutely impossible to boot the system, it tries to boot and then 'di=
es',
quite literally, as nothing functions on the system.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15650154231.59EcbcFD6.14217--

--===============2057484005==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2057484005==--
