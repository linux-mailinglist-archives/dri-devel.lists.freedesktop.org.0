Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C81714BAB
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 16:19:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 310B6899E8;
	Mon,  6 May 2019 14:19:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 54A18899D4
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 14:19:17 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 50FFD7215A; Mon,  6 May 2019 14:19:17 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 108514] heavy screen flickering with Mobility Radeon X1600 and
 kernel version 3.15rc2 onward
Date: Mon, 06 May 2019 14:19:17 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/Radeon
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: bisected, patch
X-Bugzilla-Severity: normal
X-Bugzilla-Who: werner.lueckel@googlemail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: version
Message-ID: <bug-108514-502-MWb2Ftuhge@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0455764186=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0455764186==
Content-Type: multipart/alternative; boundary="15571523570.DfdE2afe.5574"
Content-Transfer-Encoding: 7bit


--15571523570.DfdE2afe.5574
Date: Mon, 6 May 2019 14:19:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108514

Werner Lueckel <werner.lueckel@googlemail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Version|unspecified                 |DRI git

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15571523570.DfdE2afe.5574
Date: Mon, 6 May 2019 14:19:17 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:werner.lu=
eckel&#64;googlemail.com" title=3D"Werner Lueckel &lt;werner.lueckel&#64;go=
oglemail.com&gt;"> <span class=3D"fn">Werner Lueckel</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - heavy screen flickering with Mobility Radeon X1600 and ke=
rnel version 3.15rc2 onward"
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
           <td style=3D"text-align:right;">Version</td>
           <td>unspecified
           </td>
           <td>DRI git
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

--15571523570.DfdE2afe.5574--

--===============0455764186==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0455764186==--
