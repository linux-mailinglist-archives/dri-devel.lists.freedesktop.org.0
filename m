Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E994A470
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 16:50:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F926E1F1;
	Tue, 18 Jun 2019 14:50:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 879FE6E1F1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 14:50:19 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 8575F72167; Tue, 18 Jun 2019 14:50:19 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110944] [Bisected] Blender 2.8 crashes when closing certain
 windows
Date: Tue, 18 Jun 2019 14:50:19 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 19.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pierre-eric.pelloux-prayer@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110944-502-Arez9uWzoA@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110944-502@http.bugs.freedesktop.org/>
References: <bug-110944-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0147547687=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0147547687==
Content-Type: multipart/alternative; boundary="15608694191.deB486Cd.28015"
Content-Transfer-Encoding: 7bit


--15608694191.deB486Cd.28015
Date: Tue, 18 Jun 2019 14:50:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110944

--- Comment #1 from Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@=
amd.com> ---
Can you test the commit from
https://gitlab.freedesktop.org/mesa/mesa/merge_requests/1071? I think it sh=
ould
fix this issue.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15608694191.deB486Cd.28015
Date: Tue, 18 Jun 2019 14:50:19 +0000
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
   title=3D"NEW - [Bisected] Blender 2.8 crashes when closing certain windo=
ws"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110944#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [Bisected] Blender 2.8 crashes when closing certain windo=
ws"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110944">bug 11094=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pierre-eric.pelloux-prayer&#64;amd.com" title=3D"Pierre-Eric Pelloux-Prayer=
 &lt;pierre-eric.pelloux-prayer&#64;amd.com&gt;"> <span class=3D"fn">Pierre=
-Eric Pelloux-Prayer</span></a>
</span></b>
        <pre>Can you test the commit from
<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/merge_requests/1071">ht=
tps://gitlab.freedesktop.org/mesa/mesa/merge_requests/1071</a>? I think it =
should
fix this issue.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15608694191.deB486Cd.28015--

--===============0147547687==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0147547687==--
