Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 004F36FA8D
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 09:45:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53FEA89BB2;
	Mon, 22 Jul 2019 07:45:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4013889BBD
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 07:45:18 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 3CFDB72167; Mon, 22 Jul 2019 07:45:18 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111122] 2500U: Graphics corruption on kernel 5.2
Date: Mon, 22 Jul 2019 07:45:18 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: riku@sdf-eu.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-111122-502-5x7THgEfoR@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111122-502@http.bugs.freedesktop.org/>
References: <bug-111122-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2121108658=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2121108658==
Content-Type: multipart/alternative; boundary="15637815182.f1DEDf.29991"
Content-Transfer-Encoding: 7bit


--15637815182.f1DEDf.29991
Date: Mon, 22 Jul 2019 07:45:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111122

riku@sdf-eu.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |riku@sdf-eu.org

--- Comment #5 from riku@sdf-eu.org ---
Another confimation of same issue on HP Envy x360 15-bq181no with Ryzen 5 2=
500U
with Manjaro. Kernel option iommu=3Dpt fixes it, didn't try other workaroun=
ds.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15637815182.f1DEDf.29991
Date: Mon, 22 Jul 2019 07:45:18 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:riku&#64;=
sdf-eu.org" title=3D"riku&#64;sdf-eu.org">riku&#64;sdf-eu.org</a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - 2500U: Graphics corruption on kernel 5.2"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111122">bug 11112=
2</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>riku&#64;sdf-eu.org
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - 2500U: Graphics corruption on kernel 5.2"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111122#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - 2500U: Graphics corruption on kernel 5.2"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111122">bug 11112=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
riku&#64;sdf-eu.org" title=3D"riku&#64;sdf-eu.org">riku&#64;sdf-eu.org</a>
</span></b>
        <pre>Another confimation of same issue on HP Envy x360 15-bq181no w=
ith Ryzen 5 2500U
with Manjaro. Kernel option iommu=3Dpt fixes it, didn't try other workaroun=
ds.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15637815182.f1DEDf.29991--

--===============2121108658==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2121108658==--
