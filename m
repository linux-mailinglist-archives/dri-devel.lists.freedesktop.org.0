Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9216108B2C
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 10:47:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43FA36E0CF;
	Mon, 25 Nov 2019 09:47:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id E470C6E0CF
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 09:46:59 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id DB21D720E2; Mon, 25 Nov 2019 09:46:59 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 108514] heavy screen flickering with Mobility Radeon X1600 and
 kernel version 3.15rc2 onward
Date: Mon, 25 Nov 2019 09:46:59 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/Radeon
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: bisected, patch
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michel@daenzer.net
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: FIXED
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_file_loc
Message-ID: <bug-108514-502-z0QnkhE23a@http.bugs.freedesktop.org/>
In-Reply-To: <bug-108514-502@http.bugs.freedesktop.org/>
References: <bug-108514-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1518565950=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1518565950==
Content-Type: multipart/alternative; boundary="15746752190.eb4Ec4.15522"
Content-Transfer-Encoding: 7bit


--15746752190.eb4Ec4.15522
Date: Mon, 25 Nov 2019 09:46:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108514

Michel D=C3=A4nzer <michel@daenzer.net> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                URL|https://statuslife.in/      |

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15746752190.eb4Ec4.15522
Date: Mon, 25 Nov 2019 09:46:59 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:michel&#6=
4;daenzer.net" title=3D"Michel D=C3=A4nzer &lt;michel&#64;daenzer.net&gt;">=
 <span class=3D"fn">Michel D=C3=A4nzer</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - heavy screen flickering with Mobility Radeon X=
1600 and kernel version 3.15rc2 onward"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108514">bug 10851=
4</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">URL</td>
           <td>https://statuslife.in/
           </td>
           <td>
               &nbsp;
           </td>
         </tr></table>
      <p>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15746752190.eb4Ec4.15522--

--===============1518565950==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1518565950==--
