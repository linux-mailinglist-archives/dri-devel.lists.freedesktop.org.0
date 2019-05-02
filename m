Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D95711344
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2019 08:18:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB12B892B8;
	Thu,  2 May 2019 06:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id DCA67892B8
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2019 06:18:05 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id D93637215A; Thu,  2 May 2019 06:18:05 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 107049] monitor not found in 4.17+ kernel
Date: Thu, 02 May 2019 06:18:05 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dan@danny.cz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-107049-502-dSzyFOAlrQ@http.bugs.freedesktop.org/>
In-Reply-To: <bug-107049-502@http.bugs.freedesktop.org/>
References: <bug-107049-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0406752665=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0406752665==
Content-Type: multipart/alternative; boundary="15567778854.B1C440EA.18006"
Content-Transfer-Encoding: 7bit


--15567778854.B1C440EA.18006
Date: Thu, 2 May 2019 06:18:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107049

--- Comment #9 from Dan Hor=C3=A1k <dan@danny.cz> ---
Probably a good news, the amdgpu.dc=3D0 workaround isn't needed with 5.1-rc7
(haven't checked previous kernels yet).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15567778854.B1C440EA.18006
Date: Thu, 2 May 2019 06:18:05 +0000
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
   title=3D"NEW - monitor not found in 4.17+ kernel"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107049#c9">Commen=
t # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - monitor not found in 4.17+ kernel"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107049">bug 10704=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
dan&#64;danny.cz" title=3D"Dan Hor=C3=A1k &lt;dan&#64;danny.cz&gt;"> <span =
class=3D"fn">Dan Hor=C3=A1k</span></a>
</span></b>
        <pre>Probably a good news, the amdgpu.dc=3D0 workaround isn't neede=
d with 5.1-rc7
(haven't checked previous kernels yet).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15567778854.B1C440EA.18006--

--===============0406752665==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0406752665==--
