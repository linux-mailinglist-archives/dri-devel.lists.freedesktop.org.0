Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FB3224E8
	for <lists+dri-devel@lfdr.de>; Sat, 18 May 2019 22:40:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B466B89203;
	Sat, 18 May 2019 20:40:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 05E0C890F9
 for <dri-devel@lists.freedesktop.org>; Sat, 18 May 2019 20:40:30 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E6AA5721A2; Sat, 18 May 2019 20:40:29 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110704] BLACK SCREEN RADEON RX570 fail to initialise GPU
 passtrough all linux in Hypervisor PROXMOX
Date: Sat, 18 May 2019 20:40:30 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: bas@basnieuwenhuizen.nl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: qa_contact product component assigned_to
Message-ID: <bug-110704-502-bo1rRGgBrZ@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110704-502@http.bugs.freedesktop.org/>
References: <bug-110704-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1007191922=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1007191922==
Content-Type: multipart/alternative; boundary="15582120292.68608.11781"
Content-Transfer-Encoding: 7bit


--15582120292.68608.11781
Date: Sat, 18 May 2019 20:40:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110704

Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         QA Contact|mesa-dev@lists.freedesktop. |
                   |org                         |
            Product|Mesa                        |DRI
          Component|Drivers/Vulkan/radeon       |DRM/AMDgpu
           Assignee|mesa-dev@lists.freedesktop. |dri-devel@lists.freedesktop
                   |org                         |.org

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15582120292.68608.11781
Date: Sat, 18 May 2019 20:40:29 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:bas&#64;b=
asnieuwenhuizen.nl" title=3D"Bas Nieuwenhuizen &lt;bas&#64;basnieuwenhuizen=
.nl&gt;"> <span class=3D"fn">Bas Nieuwenhuizen</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - BLACK SCREEN RADEON RX570 fail to initialise GPU passtrou=
gh all linux in Hypervisor PROXMOX"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110704">bug 11070=
4</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">QA Contact</td>
           <td>mesa-dev&#64;lists.freedesktop.org
           </td>
           <td>
               &nbsp;
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Product</td>
           <td>Mesa
           </td>
           <td>DRI
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Component</td>
           <td>Drivers/Vulkan/radeon
           </td>
           <td>DRM/AMDgpu
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Assignee</td>
           <td>mesa-dev&#64;lists.freedesktop.org
           </td>
           <td>dri-devel&#64;lists.freedesktop.org
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

--15582120292.68608.11781--

--===============1007191922==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1007191922==--
