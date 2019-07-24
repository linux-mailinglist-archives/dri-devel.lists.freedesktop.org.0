Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DF57349A
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 19:08:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A8476E5F6;
	Wed, 24 Jul 2019 17:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 003876E5F6
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 17:08:11 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id EBD4672167; Wed, 24 Jul 2019 17:08:11 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110347] pp_od_clk_voltage mV cap ignored
Date: Wed, 24 Jul 2019 17:08:12 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: t.clastres@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110347-502-VpRlkJ4DE8@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110347-502@http.bugs.freedesktop.org/>
References: <bug-110347-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0915741922=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0915741922==
Content-Type: multipart/alternative; boundary="15639880910.72E80D7d2.18152"
Content-Transfer-Encoding: 7bit


--15639880910.72E80D7d2.18152
Date: Wed, 24 Jul 2019 17:08:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110347

--- Comment #5 from T=C3=A9rence Clastres <t.clastres@gmail.com> ---
Hi, Wouldn't this change merged to linux 5.3-rc1 related to this issue?=20
https://github.com/torvalds/linux/commit/7d59c41b5150d0641203f91cfcaa0f9af5=
999cce
?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15639880910.72E80D7d2.18152
Date: Wed, 24 Jul 2019 17:08:11 +0000
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
   title=3D"NEW - pp_od_clk_voltage mV cap ignored"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110347#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - pp_od_clk_voltage mV cap ignored"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110347">bug 11034=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
t.clastres&#64;gmail.com" title=3D"T=C3=A9rence Clastres &lt;t.clastres&#64=
;gmail.com&gt;"> <span class=3D"fn">T=C3=A9rence Clastres</span></a>
</span></b>
        <pre>Hi, Wouldn't this change merged to linux 5.3-rc1 related to th=
is issue?=20
<a href=3D"https://github.com/torvalds/linux/commit/7d59c41b5150d0641203f91=
cfcaa0f9af5999cce">https://github.com/torvalds/linux/commit/7d59c41b5150d06=
41203f91cfcaa0f9af5999cce</a>
?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15639880910.72E80D7d2.18152--

--===============0915741922==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0915741922==--
