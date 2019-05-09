Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E80FC184AC
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 07:02:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EBA889A44;
	Thu,  9 May 2019 05:02:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id B7BB389A44
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2019 05:02:31 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B43DC7215A; Thu,  9 May 2019 05:02:31 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110637] Enabling OpenCL in Libreoffice kills Vega 64
Date: Thu, 09 May 2019 05:02:31 +0000
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
Message-ID: <bug-110637-502-pqnaNYGeni@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110637-502@http.bugs.freedesktop.org/>
References: <bug-110637-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1980825331=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1980825331==
Content-Type: multipart/alternative; boundary="15573781511.Cf82179F.7049"
Content-Transfer-Encoding: 7bit


--15573781511.Cf82179F.7049
Date: Thu, 9 May 2019 05:02:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110637

--- Comment #1 from Alexander Mezin <mezin.alexander@gmail.com> ---
And the same thing with 4.19.40. And with manually built drm-next.

Also, not only libreoffice, but literally any application that uses OpenCL
triggers the same problem. It seems that I just can't use OpenCL at all.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15573781511.Cf82179F.7049
Date: Thu, 9 May 2019 05:02:31 +0000
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
   title=3D"NEW - Enabling OpenCL in Libreoffice kills Vega 64"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110637#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Enabling OpenCL in Libreoffice kills Vega 64"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110637">bug 11063=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mezin.alexander&#64;gmail.com" title=3D"Alexander Mezin &lt;mezin.alexander=
&#64;gmail.com&gt;"> <span class=3D"fn">Alexander Mezin</span></a>
</span></b>
        <pre>And the same thing with 4.19.40. And with manually built drm-n=
ext.

Also, not only libreoffice, but literally any application that uses OpenCL
triggers the same problem. It seems that I just can't use OpenCL at all.</p=
re>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15573781511.Cf82179F.7049--

--===============1980825331==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1980825331==--
