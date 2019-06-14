Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 235054583F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 11:09:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95B4C8938F;
	Fri, 14 Jun 2019 09:09:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id CEE308938F
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 09:09:05 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C711072167; Fri, 14 Jun 2019 09:09:05 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110795] Unable to install on latest Ubuntu (19.04)
Date: Fri, 14 Jun 2019 09:09:05 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu-pro
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: ashark@linuxcomp.ru
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-110795-502-saLmgkNQWx@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110795-502@http.bugs.freedesktop.org/>
References: <bug-110795-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0774044548=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0774044548==
Content-Type: multipart/alternative; boundary="15605033450.91CbA.7668"
Content-Transfer-Encoding: 7bit


--15605033450.91CbA.7668
Date: Fri, 14 Jun 2019 09:09:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110795

Andrew Shark <ashark@linuxcomp.ru> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #144479|0                           |1
        is obsolete|                            |

--- Comment #21 from Andrew Shark <ashark@linuxcomp.ru> ---
Created attachment 144539
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144539&action=3Dedit
Script to modify packages to be able to use with ubuntu 19.04

Updated to work with version amdgpu-pro 19.20-812932
Added nuclear removing instructions
amdgpu-dkms now builds successfully

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15605033450.91CbA.7668
Date: Fri, 14 Jun 2019 09:09:05 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:ashark&#6=
4;linuxcomp.ru" title=3D"Andrew Shark &lt;ashark&#64;linuxcomp.ru&gt;"> <sp=
an class=3D"fn">Andrew Shark</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED INVALID - Unable to install on latest Ubuntu (19.04)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110795">bug 11079=
5</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Attachment #144479 is obsolete</=
td>
           <td>
               &nbsp;
           </td>
           <td>1
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED INVALID - Unable to install on latest Ubuntu (19.04)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110795#c21">Comme=
nt # 21</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED INVALID - Unable to install on latest Ubuntu (19.04)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110795">bug 11079=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ashark&#64;linuxcomp.ru" title=3D"Andrew Shark &lt;ashark&#64;linuxcomp.ru&=
gt;"> <span class=3D"fn">Andrew Shark</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144539=
" name=3D"attach_144539" title=3D"Script to modify packages to be able to u=
se with ubuntu 19.04">attachment 144539</a> <a href=3D"attachment.cgi?id=3D=
144539&amp;action=3Dedit" title=3D"Script to modify packages to be able to =
use with ubuntu 19.04">[details]</a></span> <a href=3D'page.cgi?id=3Dsplint=
er.html&amp;bug=3D110795&amp;attachment=3D144539'>[review]</a>
Script to modify packages to be able to use with ubuntu 19.04

Updated to work with version amdgpu-pro 19.20-812932
Added nuclear removing instructions
amdgpu-dkms now builds successfully</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15605033450.91CbA.7668--

--===============0774044548==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0774044548==--
