Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DFE28B59
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 22:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CBA889F77;
	Thu, 23 May 2019 20:13:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id B88C989FBC
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 20:13:51 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B341372167; Thu, 23 May 2019 20:13:51 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110712] [regression]Raven Ridge: System freeze but mouse cursor
 able to move when using Firefox Webrender.
Date: Thu, 23 May 2019 20:13:51 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: haxk612@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110712-502-5CRzStVvqT@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110712-502@http.bugs.freedesktop.org/>
References: <bug-110712-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1955476109=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1955476109==
Content-Type: multipart/alternative; boundary="15586424312.f4c1d5c.589"
Content-Transfer-Encoding: 7bit


--15586424312.f4c1d5c.589
Date: Thu, 23 May 2019 20:13:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110712

--- Comment #1 from Haxk20 <haxk612@gmail.com> ---
Im have not been able to get dmesg in the past few days and will not be abl=
e to
get one in upcoming few days but hopefully i will be able to get one by the=
 end
of the month.
If somebody could post dmesg in the mean time that would be fantastic.
And if we could get somebody to look at this it would be even more awesome.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15586424312.f4c1d5c.589
Date: Thu, 23 May 2019 20:13:51 +0000
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
   title=3D"NEW - [regression]Raven Ridge: System freeze but mouse cursor a=
ble to move when using Firefox Webrender."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110712#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [regression]Raven Ridge: System freeze but mouse cursor a=
ble to move when using Firefox Webrender."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110712">bug 11071=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
haxk612&#64;gmail.com" title=3D"Haxk20 &lt;haxk612&#64;gmail.com&gt;"> <spa=
n class=3D"fn">Haxk20</span></a>
</span></b>
        <pre>Im have not been able to get dmesg in the past few days and wi=
ll not be able to
get one in upcoming few days but hopefully i will be able to get one by the=
 end
of the month.
If somebody could post dmesg in the mean time that would be fantastic.
And if we could get somebody to look at this it would be even more awesome.=
</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15586424312.f4c1d5c.589--

--===============1955476109==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1955476109==--
