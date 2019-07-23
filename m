Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FFE7117A
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 07:56:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F317789E2C;
	Tue, 23 Jul 2019 05:56:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 06FFC89E3F
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 05:56:17 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 040A972167; Tue, 23 Jul 2019 05:56:17 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 105718] amdgpu reported fan speed looks too high (dual fan
 Sapphire Pulse Vega 56)
Date: Tue, 23 Jul 2019 05:56:17 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wedens13@yandex.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-105718-502-0fBIyLZXq1@http.bugs.freedesktop.org/>
In-Reply-To: <bug-105718-502@http.bugs.freedesktop.org/>
References: <bug-105718-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0571122215=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0571122215==
Content-Type: multipart/alternative; boundary="15638613763.201cC4.14416"
Content-Transfer-Encoding: 7bit


--15638613763.201cC4.14416
Date: Tue, 23 Jul 2019 05:56:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105718

--- Comment #3 from wedens13@yandex.ru ---
I have exactly the same issue with Sapphire Pulse Vega 56. It also reports =
some
unreasonably high value (something around 3000rpm) as max fans RPM.

I've found this thread
https://www.hwinfo.com/forum/Thread-Solved-SAPPHIRE-PULSE-Radeon%E2%84%A2-R=
X-Vega56-8G-HBM2-Wrong-FAN-RPM.
Apparently this issue was solved in windows with AMD driver update.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15638613763.201cC4.14416
Date: Tue, 23 Jul 2019 05:56:16 +0000
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
   title=3D"NEW - amdgpu reported fan speed looks too high (dual fan Sapphi=
re Pulse Vega 56)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105718#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu reported fan speed looks too high (dual fan Sapphi=
re Pulse Vega 56)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105718">bug 10571=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
wedens13&#64;yandex.ru" title=3D"wedens13&#64;yandex.ru">wedens13&#64;yande=
x.ru</a>
</span></b>
        <pre>I have exactly the same issue with Sapphire Pulse Vega 56. It =
also reports some
unreasonably high value (something around 3000rpm) as max fans RPM.

I've found this thread
<a href=3D"https://www.hwinfo.com/forum/Thread-Solved-SAPPHIRE-PULSE-Radeon=
%E2%84%A2-RX-Vega56-8G-HBM2-Wrong-FAN-RPM">https://www.hwinfo.com/forum/Thr=
ead-Solved-SAPPHIRE-PULSE-Radeon%E2%84%A2-RX-Vega56-8G-HBM2-Wrong-FAN-RPM</=
a>.
Apparently this issue was solved in windows with AMD driver update.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15638613763.201cC4.14416--

--===============0571122215==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0571122215==--
