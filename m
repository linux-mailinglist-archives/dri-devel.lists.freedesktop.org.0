Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA2BEC4BB
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 15:30:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E170C6F811;
	Fri,  1 Nov 2019 14:30:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id B8F0E6F811
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 14:30:14 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id AC376720E2; Fri,  1 Nov 2019 14:30:14 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112192] regression: modesetting does not work with my Radeon R5
 230
Date: Fri, 01 Nov 2019 14:30:15 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: estellnb@elstel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-112192-502-YQb4j0cUyU@http.bugs.freedesktop.org/>
In-Reply-To: <bug-112192-502@http.bugs.freedesktop.org/>
References: <bug-112192-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1469891743=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1469891743==
Content-Type: multipart/alternative; boundary="15726186140.9a8e.23059"
Content-Transfer-Encoding: 7bit


--15726186140.9a8e.23059
Date: Fri, 1 Nov 2019 14:30:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112192

--- Comment #9 from Elmar Stellnberger <estellnb@elstel.org> ---
  Ahh, I should have known. That is a detriment with the Debian live dvd.
Basically I could install the firmware with hindsight and then restart the
X-server.=20
  There is another bug with the VESA driver which has gone unreported yet. =
If
the DPMS standbys the screen then the color palette is wrong on resume (no
s2ram, only a display standby). I wonder if anyone cares to still support t=
he
VESA driver.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15726186140.9a8e.23059
Date: Fri, 1 Nov 2019 14:30:14 +0000
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
   title=3D"NEW - regression: modesetting does not work with my Radeon R5 2=
30"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112192#c9">Commen=
t # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - regression: modesetting does not work with my Radeon R5 2=
30"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112192">bug 11219=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
estellnb&#64;elstel.org" title=3D"Elmar Stellnberger &lt;estellnb&#64;elste=
l.org&gt;"> <span class=3D"fn">Elmar Stellnberger</span></a>
</span></b>
        <pre>  Ahh, I should have known. That is a detriment with the Debia=
n live dvd.
Basically I could install the firmware with hindsight and then restart the
X-server.=20
  There is another bug with the VESA driver which has gone unreported yet. =
If
the DPMS standbys the screen then the color palette is wrong on resume (no
s2ram, only a display standby). I wonder if anyone cares to still support t=
he
VESA driver.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15726186140.9a8e.23059--

--===============1469891743==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1469891743==--
