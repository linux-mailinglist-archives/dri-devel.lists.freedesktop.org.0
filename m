Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 946C078071
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jul 2019 18:32:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 771DC89D5B;
	Sun, 28 Jul 2019 16:32:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 874BA89D5B
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2019 16:32:52 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7D68D72167; Sun, 28 Jul 2019 16:32:52 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111235] radeonsi_drv_video.so should report support for packed
 headers
Date: Sun, 28 Jul 2019 16:32:52 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: oreaus@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: op_sys rep_platform
Message-ID: <bug-111235-502-R84pQNI9am@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111235-502@http.bugs.freedesktop.org/>
References: <bug-111235-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0885671482=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0885671482==
Content-Type: multipart/alternative; boundary="15643315720.165b.4521"
Content-Transfer-Encoding: 7bit


--15643315720.165b.4521
Date: Sun, 28 Jul 2019 16:32:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111235

Scott Moreau <oreaus@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 OS|All                         |Linux (All)
           Hardware|Other                       |x86-64 (AMD64)

--- Comment #1 from Scott Moreau <oreaus@gmail.com> ---
After chatting with Mark Thompson, I realize that the patch is incorrect
because it advertises packed header support which is not implemented in the
driver. Proper packed header support should be implemented to fix this prob=
lem.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15643315720.165b.4521
Date: Sun, 28 Jul 2019 16:32:52 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:oreaus&#6=
4;gmail.com" title=3D"Scott Moreau &lt;oreaus&#64;gmail.com&gt;"> <span cla=
ss=3D"fn">Scott Moreau</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - radeonsi_drv_video.so should report support for packed he=
aders"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111235">bug 11123=
5</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">OS</td>
           <td>All
           </td>
           <td>Linux (All)
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Hardware</td>
           <td>Other
           </td>
           <td>x86-64 (AMD64)
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - radeonsi_drv_video.so should report support for packed he=
aders"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111235#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - radeonsi_drv_video.so should report support for packed he=
aders"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111235">bug 11123=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
oreaus&#64;gmail.com" title=3D"Scott Moreau &lt;oreaus&#64;gmail.com&gt;"> =
<span class=3D"fn">Scott Moreau</span></a>
</span></b>
        <pre>After chatting with Mark Thompson, I realize that the patch is=
 incorrect
because it advertises packed header support which is not implemented in the
driver. Proper packed header support should be implemented to fix this prob=
lem.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15643315720.165b.4521--

--===============0885671482==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0885671482==--
