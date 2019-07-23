Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6F07117B
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 07:58:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 851E389E98;
	Tue, 23 Jul 2019 05:57:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1ACF789E3B
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 05:57:58 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 1532672167; Tue, 23 Jul 2019 05:57:58 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110749] [Vega 11] [amdgpu retry page fault
 VM_L2_PROTECTION_FAULT_STATUS] System lock up during playing Steam version of
 Saints Row 3
Date: Tue, 23 Jul 2019 05:57:58 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: wedens13@yandex.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: highest
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110749-502-ubPoJCYEws@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110749-502@http.bugs.freedesktop.org/>
References: <bug-110749-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0864376542=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0864376542==
Content-Type: multipart/alternative; boundary="15638614780.7BBf.15887"
Content-Transfer-Encoding: 7bit


--15638614780.7BBf.15887
Date: Tue, 23 Jul 2019 05:57:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110749

--- Comment #5 from wedens13@yandex.ru ---
Seems like another case of https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
05251

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15638614780.7BBf.15887
Date: Tue, 23 Jul 2019 05:57:58 +0000
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
   title=3D"NEW - [Vega 11] [amdgpu retry page fault VM_L2_PROTECTION_FAULT=
_STATUS] System lock up during playing Steam version of Saints Row 3"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110749#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [Vega 11] [amdgpu retry page fault VM_L2_PROTECTION_FAULT=
_STATUS] System lock up during playing Steam version of Saints Row 3"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110749">bug 11074=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
wedens13&#64;yandex.ru" title=3D"wedens13&#64;yandex.ru">wedens13&#64;yande=
x.ru</a>
</span></b>
        <pre>Seems like another case of <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [Vega10] GPU lockup on boot: VMC page fault"
   href=3D"show_bug.cgi?id=3D105251">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D105251</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15638614780.7BBf.15887--

--===============0864376542==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0864376542==--
