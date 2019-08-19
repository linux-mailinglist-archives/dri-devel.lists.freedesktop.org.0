Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D08BC94E09
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 21:28:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CF986E277;
	Mon, 19 Aug 2019 19:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 398096E281
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 19:28:15 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 35F7472161; Mon, 19 Aug 2019 19:28:15 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 104602] [apitrace] Graphical artifacts in Civilization VI on RX
 Vega
Date: Mon, 19 Aug 2019 19:28:15 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 17.3
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: maraeo@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: FIXED
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-104602-502-gPA00p3iEZ@http.bugs.freedesktop.org/>
In-Reply-To: <bug-104602-502@http.bugs.freedesktop.org/>
References: <bug-104602-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0950225967=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0950225967==
Content-Type: multipart/alternative; boundary="15662428952.a2B4133cb.11027"
Content-Transfer-Encoding: 7bit


--15662428952.a2B4133cb.11027
Date: Mon, 19 Aug 2019 19:28:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104602

--- Comment #23 from Marek Ol=C5=A1=C3=A1k <maraeo@gmail.com> ---
Connor, there is indeed an issue with how we set SPI_TMPRING_SIZE and same =
for
compute.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15662428952.a2B4133cb.11027
Date: Mon, 19 Aug 2019 19:28:15 +0000
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
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [apitrace] Graphical artifacts in Civilization=
 VI on RX Vega"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104602#c23">Comme=
nt # 23</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [apitrace] Graphical artifacts in Civilization=
 VI on RX Vega"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104602">bug 10460=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
maraeo&#64;gmail.com" title=3D"Marek Ol=C5=A1=C3=A1k &lt;maraeo&#64;gmail.c=
om&gt;"> <span class=3D"fn">Marek Ol=C5=A1=C3=A1k</span></a>
</span></b>
        <pre>Connor, there is indeed an issue with how we set SPI_TMPRING_S=
IZE and same for
compute.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15662428952.a2B4133cb.11027--

--===============0950225967==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0950225967==--
