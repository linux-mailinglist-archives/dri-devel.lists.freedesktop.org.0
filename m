Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AC0A1BBC
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 15:44:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9230989260;
	Thu, 29 Aug 2019 13:44:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id CD8DF89258
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 13:44:44 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C2BC372161; Thu, 29 Aug 2019 13:44:44 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110865] Rx480 consumes 20w more power in idle than under Windows
Date: Thu, 29 Aug 2019 13:44:45 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: mwolf@adiumentum.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110865-502-u45E5yX7Cp@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110865-502@http.bugs.freedesktop.org/>
References: <bug-110865-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1865146490=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1865146490==
Content-Type: multipart/alternative; boundary="15670862840.B00b.14068"
Content-Transfer-Encoding: 7bit


--15670862840.B00b.14068
Date: Thu, 29 Aug 2019 13:44:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110865

--- Comment #31 from Martin <mwolf@adiumentum.com> ---
well the flickering goes away, if I lock the clocks to "low" or "high"

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15670862840.B00b.14068
Date: Thu, 29 Aug 2019 13:44:44 +0000
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
   title=3D"NEW - Rx480 consumes 20w more power in idle than under Windows"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110865#c31">Comme=
nt # 31</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Rx480 consumes 20w more power in idle than under Windows"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110865">bug 11086=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mwolf&#64;adiumentum.com" title=3D"Martin &lt;mwolf&#64;adiumentum.com&gt;"=
> <span class=3D"fn">Martin</span></a>
</span></b>
        <pre>well the flickering goes away, if I lock the clocks to &quot;l=
ow&quot; or &quot;high&quot;</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15670862840.B00b.14068--

--===============1865146490==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1865146490==--
