Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2C1ADB34
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 16:32:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D6A893D1;
	Mon,  9 Sep 2019 14:32:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 724FA893CD
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2019 14:32:22 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6EF1F72167; Mon,  9 Sep 2019 14:32:22 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111527] obs-studio + latest mesa on amdgpu/vega64 leaks kernel
 memory rapidly
Date: Mon, 09 Sep 2019 14:32:22 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: michel@daenzer.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111527-502-HeRT4KPrdO@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111527-502@http.bugs.freedesktop.org/>
References: <bug-111527-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0493430592=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0493430592==
Content-Type: multipart/alternative; boundary="15680395421.2E6D7faea.2700"
Content-Transfer-Encoding: 7bit


--15680395421.2E6D7faea.2700
Date: Mon, 9 Sep 2019 14:32:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111527

--- Comment #3 from Michel D=C3=A4nzer <michel@daenzer.net> ---
Does https://gitlab.freedesktop.org/mesa/mesa/merge_requests/1907 help by a=
ny
chance?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15680395421.2E6D7faea.2700
Date: Mon, 9 Sep 2019 14:32:22 +0000
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
   title=3D"NEW - obs-studio + latest mesa on amdgpu/vega64 leaks kernel me=
mory rapidly"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111527#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - obs-studio + latest mesa on amdgpu/vega64 leaks kernel me=
mory rapidly"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111527">bug 11152=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
michel&#64;daenzer.net" title=3D"Michel D=C3=A4nzer &lt;michel&#64;daenzer.=
net&gt;"> <span class=3D"fn">Michel D=C3=A4nzer</span></a>
</span></b>
        <pre>Does <a href=3D"https://gitlab.freedesktop.org/mesa/mesa/merge=
_requests/1907">https://gitlab.freedesktop.org/mesa/mesa/merge_requests/190=
7</a> help by any
chance?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15680395421.2E6D7faea.2700--

--===============0493430592==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0493430592==--
