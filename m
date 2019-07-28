Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0912B77F53
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jul 2019 13:57:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A4226E046;
	Sun, 28 Jul 2019 11:57:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7CA206E029
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2019 11:57:13 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 70BF572167; Sun, 28 Jul 2019 11:57:13 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110199] [amdgpu] Screen flickering when using a 75Hz monitor
 paired with an RX 480 GPU
Date: Sun, 28 Jul 2019 11:57:13 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: giant+bug_mesa@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110199-502-5aupDhzhhf@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110199-502@http.bugs.freedesktop.org/>
References: <bug-110199-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1300708775=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1300708775==
Content-Type: multipart/alternative; boundary="15643150330.8e2Be7.19827"
Content-Transfer-Encoding: 7bit


--15643150330.8e2Be7.19827
Date: Sun, 28 Jul 2019 11:57:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110199

--- Comment #11 from Bennet <giant+bug_mesa@mailbox.org> ---
Only kernel 4.19 works for me with 75hz , so probably seem to be a problem
related to Free Sync.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15643150330.8e2Be7.19827
Date: Sun, 28 Jul 2019 11:57:13 +0000
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
   title=3D"NEW - [amdgpu] Screen flickering when using a 75Hz monitor pair=
ed with an RX 480 GPU"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110199#c11">Comme=
nt # 11</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [amdgpu] Screen flickering when using a 75Hz monitor pair=
ed with an RX 480 GPU"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110199">bug 11019=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
giant+bug_mesa&#64;mailbox.org" title=3D"Bennet &lt;giant+bug_mesa&#64;mail=
box.org&gt;"> <span class=3D"fn">Bennet</span></a>
</span></b>
        <pre>Only kernel 4.19 works for me with 75hz , so probably seem to =
be a problem
related to Free Sync.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15643150330.8e2Be7.19827--

--===============1300708775==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1300708775==--
