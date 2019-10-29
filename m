Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B34E831C
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2019 09:21:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C59708936C;
	Tue, 29 Oct 2019 08:21:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id C31FE6E11F
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2019 08:21:00 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id BFCBD720E2; Tue, 29 Oct 2019 08:21:00 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111011] [CI][BAT][VEGA M]: igt@kms_addfb_basic@* - warn/fail -
 Failed assertion: __gem_set_tiling(fd, handle, tiling, stride) == 0
Date: Tue, 29 Oct 2019 08:21:00 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: IGT
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: arkadiusz.hiler@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: assigned_to component qa_contact
Message-ID: <bug-111011-502-MRMXa2RLiO@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111011-502@http.bugs.freedesktop.org/>
References: <bug-111011-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1827928551=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1827928551==
Content-Type: multipart/alternative; boundary="15723372602.9EB5.29130"
Content-Transfer-Encoding: 7bit


--15723372602.9EB5.29130
Date: Tue, 29 Oct 2019 08:21:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111011

Arek Hiler <arkadiusz.hiler@intel.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Assignee|intel-gfx-bugs@lists.freede |dri-devel@lists.freedesktop
                   |sktop.org                   |.org
          Component|DRM/Intel                   |IGT
         QA Contact|intel-gfx-bugs@lists.freede |
                   |sktop.org                   |

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15723372602.9EB5.29130
Date: Tue, 29 Oct 2019 08:21:00 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:arkadiusz=
.hiler&#64;intel.com" title=3D"Arek Hiler &lt;arkadiusz.hiler&#64;intel.com=
&gt;"> <span class=3D"fn">Arek Hiler</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [CI][BAT][VEGA M]: igt&#64;kms_addfb_basic&#64;* - warn/f=
ail - Failed assertion: __gem_set_tiling(fd, handle, tiling, stride) =3D=3D=
 0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111011">bug 11101=
1</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Assignee</td>
           <td>intel-gfx-bugs&#64;lists.freedesktop.org
           </td>
           <td>dri-devel&#64;lists.freedesktop.org
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Component</td>
           <td>DRM/Intel
           </td>
           <td>IGT
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">QA Contact</td>
           <td>intel-gfx-bugs&#64;lists.freedesktop.org
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

--15723372602.9EB5.29130--

--===============1827928551==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1827928551==--
