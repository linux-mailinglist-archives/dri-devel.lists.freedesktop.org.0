Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D79A5AFAB
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 12:42:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A9689ACD;
	Sun, 30 Jun 2019 10:42:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id A352989ACD
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2019 10:42:53 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 9AB1F72167; Sun, 30 Jun 2019 10:42:53 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110733] [Regression] Kernel 4.19.x + linux-firmware 20190514 +
 Vega 64: boot fails
Date: Sun, 30 Jun 2019 10:42:53 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mezin.alexander@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110733-502-uJq7yXxRNX@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110733-502@http.bugs.freedesktop.org/>
References: <bug-110733-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1998367732=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1998367732==
Content-Type: multipart/alternative; boundary="15618913730.11c88.23453"
Content-Transfer-Encoding: 7bit


--15618913730.11c88.23453
Date: Sun, 30 Jun 2019 10:42:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110733

--- Comment #1 from Alexander Mezin <mezin.alexander@gmail.com> ---
This is caused by vega10_sos.bin
Still happens with linux-firmware 20190618 and linux 4.19.56

https://bugzilla.kernel.org/show_bug.cgi?id=3D203627#c2

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15618913730.11c88.23453
Date: Sun, 30 Jun 2019 10:42:53 +0000
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
   title=3D"NEW - [Regression] Kernel 4.19.x + linux-firmware 20190514 + Ve=
ga 64: boot fails"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110733#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [Regression] Kernel 4.19.x + linux-firmware 20190514 + Ve=
ga 64: boot fails"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110733">bug 11073=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mezin.alexander&#64;gmail.com" title=3D"Alexander Mezin &lt;mezin.alexander=
&#64;gmail.com&gt;"> <span class=3D"fn">Alexander Mezin</span></a>
</span></b>
        <pre>This is caused by vega10_sos.bin
Still happens with linux-firmware 20190618 and linux 4.19.56

<a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D203627#c2">https:/=
/bugzilla.kernel.org/show_bug.cgi?id=3D203627#c2</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15618913730.11c88.23453--

--===============1998367732==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1998367732==--
