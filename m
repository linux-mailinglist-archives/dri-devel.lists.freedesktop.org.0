Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52710D6988
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 20:37:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 202126E5B4;
	Mon, 14 Oct 2019 18:37:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0B3E46E5B4
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 18:37:47 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 0849A7296E; Mon, 14 Oct 2019 18:37:47 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111948] [Vega10][bisected] Vega56 VM_L2_PROTECTION_FAULT when
 logging into KDE with kernel 5.3.0-rc1 and newer
Date: Mon, 14 Oct 2019 18:37:47 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: freedesktop@forsaken.se
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-111948-502-vPrJR0WbSs@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111948-502@http.bugs.freedesktop.org/>
References: <bug-111948-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0633706204=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0633706204==
Content-Type: multipart/alternative; boundary="15710782661.24D6A.1838"
Content-Transfer-Encoding: 7bit


--15710782661.24D6A.1838
Date: Mon, 14 Oct 2019 18:37:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111948

Andreas <freedesktop@forsaken.se> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|FIXED                       |---

--- Comment #2 from Andreas <freedesktop@forsaken.se> ---
I spoke too soon, I'm getting it on 5.3.6 now as well as on 5.4.0-rc3

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15710782661.24D6A.1838
Date: Mon, 14 Oct 2019 18:37:46 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:freedeskt=
op&#64;forsaken.se" title=3D"Andreas &lt;freedesktop&#64;forsaken.se&gt;"> =
<span class=3D"fn">Andreas</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - [Vega10][bisected] Vega56 VM_L2_PROTECTION_FAULT whe=
n logging into KDE with kernel 5.3.0-rc1 and newer"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111948">bug 11194=
8</a>
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
   title=3D"REOPENED - [Vega10][bisected] Vega56 VM_L2_PROTECTION_FAULT whe=
n logging into KDE with kernel 5.3.0-rc1 and newer"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111948#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - [Vega10][bisected] Vega56 VM_L2_PROTECTION_FAULT whe=
n logging into KDE with kernel 5.3.0-rc1 and newer"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111948">bug 11194=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
freedesktop&#64;forsaken.se" title=3D"Andreas &lt;freedesktop&#64;forsaken.=
se&gt;"> <span class=3D"fn">Andreas</span></a>
</span></b>
        <pre>I spoke too soon, I'm getting it on 5.3.6 now as well as on 5.=
4.0-rc3</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15710782661.24D6A.1838--

--===============0633706204==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0633706204==--
