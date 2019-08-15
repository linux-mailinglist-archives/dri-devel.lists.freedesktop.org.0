Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E719A8F28F
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 19:47:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06FE16E1BE;
	Thu, 15 Aug 2019 17:47:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 034AC6E1BE
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 17:47:24 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id ECD227215A; Thu, 15 Aug 2019 17:47:23 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111211] Kernel 5.2.2 introduced tearing, corruption and freezes
 with Raven Ridge 2500U
Date: Thu, 15 Aug 2019 17:47:24 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: brauliobo@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-111211-502-2RPU1i1Eot@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111211-502@http.bugs.freedesktop.org/>
References: <bug-111211-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1163034388=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1163034388==
Content-Type: multipart/alternative; boundary="15658912430.F9c77b1.21708"
Content-Transfer-Encoding: 7bit


--15658912430.F9c77b1.21708
Date: Thu, 15 Aug 2019 17:47:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111211

Br=C3=A1ulio Barros de Oliveira <brauliobo@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|FIXED                       |---

--- Comment #7 from Br=C3=A1ulio Barros de Oliveira <brauliobo@gmail.com> -=
--
the problem is still there and more severe with kernel 5.2.8.
freezes are back also.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15658912430.F9c77b1.21708
Date: Thu, 15 Aug 2019 17:47:23 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:brauliobo=
&#64;gmail.com" title=3D"Br=C3=A1ulio Barros de Oliveira &lt;brauliobo&#64;=
gmail.com&gt;"> <span class=3D"fn">Br=C3=A1ulio Barros de Oliveira</span></=
a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Kernel 5.2.2 introduced tearing, corruption and free=
zes with Raven Ridge 2500U"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111211">bug 11121=
1</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>RESOLVED
           </td>
           <td>REOPENED
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>FIXED
           </td>
           <td>---
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Kernel 5.2.2 introduced tearing, corruption and free=
zes with Raven Ridge 2500U"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111211#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Kernel 5.2.2 introduced tearing, corruption and free=
zes with Raven Ridge 2500U"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111211">bug 11121=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
brauliobo&#64;gmail.com" title=3D"Br=C3=A1ulio Barros de Oliveira &lt;braul=
iobo&#64;gmail.com&gt;"> <span class=3D"fn">Br=C3=A1ulio Barros de Oliveira=
</span></a>
</span></b>
        <pre>the problem is still there and more severe with kernel 5.2.8.
freezes are back also.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15658912430.F9c77b1.21708--

--===============1163034388==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1163034388==--
