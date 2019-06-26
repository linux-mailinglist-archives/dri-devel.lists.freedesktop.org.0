Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCC65701B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 19:58:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C05AA6E4D2;
	Wed, 26 Jun 2019 17:58:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 67F4B6E4B5
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 17:58:10 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5F8BD72167; Wed, 26 Jun 2019 17:58:10 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110783] Mesa 19.1 rc crashing MPV with VAAPI
Date: Wed, 26 Jun 2019 17:58:10 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/r600
X-Bugzilla-Version: 19.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: iive@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_severity
Message-ID: <bug-110783-502-d1vlJfdVRy@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110783-502@http.bugs.freedesktop.org/>
References: <bug-110783-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0998845976=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0998845976==
Content-Type: multipart/alternative; boundary="15615718900.17Ecd7.29648"
Content-Transfer-Encoding: 7bit


--15615718900.17Ecd7.29648
Date: Wed, 26 Jun 2019 17:58:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110783

iive@yahoo.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Severity|normal                      |major

--- Comment #17 from iive@yahoo.com ---
My distribution just upgraded to Mesa-19.1.1 release and I hit this bug.

I can't believe the fix has been forgotten.

Please, push it ASAP.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15615718900.17Ecd7.29648
Date: Wed, 26 Jun 2019 17:58:10 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:iive&#64;=
yahoo.com" title=3D"iive&#64;yahoo.com">iive&#64;yahoo.com</a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Mesa 19.1 rc crashing MPV with VAAPI"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110783">bug 11078=
3</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Severity</td>
           <td>normal
           </td>
           <td>major
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Mesa 19.1 rc crashing MPV with VAAPI"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110783#c17">Comme=
nt # 17</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Mesa 19.1 rc crashing MPV with VAAPI"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110783">bug 11078=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
iive&#64;yahoo.com" title=3D"iive&#64;yahoo.com">iive&#64;yahoo.com</a>
</span></b>
        <pre>My distribution just upgraded to Mesa-19.1.1 release and I hit=
 this bug.

I can't believe the fix has been forgotten.

Please, push it ASAP.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15615718900.17Ecd7.29648--

--===============0998845976==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0998845976==--
