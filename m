Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3AA776C8
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jul 2019 07:47:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72E956EE8F;
	Sat, 27 Jul 2019 05:47:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id D44956EE8E
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2019 05:47:44 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id CEC0972168; Sat, 27 Jul 2019 05:47:44 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111229] Unable to unbind GPU from amdgpu
Date: Sat, 27 Jul 2019 05:47:44 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wedens13@yandex.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: see_also
Message-ID: <bug-111229-502-znrnd7rtoB@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111229-502@http.bugs.freedesktop.org/>
References: <bug-111229-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0848654370=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0848654370==
Content-Type: multipart/alternative; boundary="15642064641.144bE.23291"
Content-Transfer-Encoding: 7bit


--15642064641.144bE.23291
Date: Sat, 27 Jul 2019 05:47:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111229

wedens13@yandex.ru changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           See Also|                            |https://bugs.freedesktop.or
                   |                            |g/show_bug.cgi?id=3D106993

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15642064641.144bE.23291
Date: Sat, 27 Jul 2019 05:47:44 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:wedens13&=
#64;yandex.ru" title=3D"wedens13&#64;yandex.ru">wedens13&#64;yandex.ru</a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Unable to unbind GPU from amdgpu"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111229">bug 11122=
9</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">See Also</td>
           <td>
               &nbsp;
           </td>
           <td>https://bugs.freedesktop.org/show_bug.cgi?id=3D106993
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

--15642064641.144bE.23291--

--===============0848654370==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0848654370==--
