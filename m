Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C631A3921B
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 18:30:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAF5D892C9;
	Fri,  7 Jun 2019 16:30:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id CCF84891D9
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 16:30:32 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C9E3F72167; Fri,  7 Jun 2019 16:30:32 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110795] Unable to install on latest Ubuntu (19.04)
Date: Fri, 07 Jun 2019 16:30:32 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu-pro
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: ashark@linuxcomp.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-110795-502-mXnzgldcBz@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1470568924=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1470568924==
Content-Type: multipart/alternative; boundary="15599250322.cAADAA.7278"
Content-Transfer-Encoding: 7bit


--15599250322.cAADAA.7278
Date: Fri, 7 Jun 2019 16:30:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110795

Andrew Shark <ashark@linuxcomp.ru> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #144478|0                           |1
        is obsolete|                            |

--- Comment #11 from Andrew Shark <ashark@linuxcomp.ru> ---
Created attachment 144479
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144479&action=3Dedit
Script to modify packages to be able to use with ubuntu 19.04

Added "-f" to rm command to prevent error message in output
rm: cannot remove 'amdgpu-core_19.10-785425_all.no_ub_ver_chk.deb': No such
file or directory
Explicitly specified that problems appears in 19.10-785425 release, because
they may be fixed by amd in further releases

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15599250322.cAADAA.7278
Date: Fri, 7 Jun 2019 16:30:32 +0000
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
          bz_status_NEW "
   title=3D"NEW - Unable to install on latest Ubuntu (19.04)"
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
           <td style=3D"text-align:right;">Attachment #144478 is obsolete</=
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
          bz_status_NEW "
   title=3D"NEW - Unable to install on latest Ubuntu (19.04)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110795#c11">Comme=
nt # 11</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Unable to install on latest Ubuntu (19.04)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110795">bug 11079=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ashark&#64;linuxcomp.ru" title=3D"Andrew Shark &lt;ashark&#64;linuxcomp.ru&=
gt;"> <span class=3D"fn">Andrew Shark</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144479=
" name=3D"attach_144479" title=3D"Script to modify packages to be able to u=
se with ubuntu 19.04">attachment 144479</a> <a href=3D"attachment.cgi?id=3D=
144479&amp;action=3Dedit" title=3D"Script to modify packages to be able to =
use with ubuntu 19.04">[details]</a></span> <a href=3D'page.cgi?id=3Dsplint=
er.html&amp;bug=3D110795&amp;attachment=3D144479'>[review]</a>
Script to modify packages to be able to use with ubuntu 19.04

Added &quot;-f&quot; to rm command to prevent error message in output
rm: cannot remove 'amdgpu-core_19.10-785425_all.no_ub_ver_chk.deb': No such
file or directory
Explicitly specified that problems appears in 19.10-785425 release, because
they may be fixed by amd in further releases</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15599250322.cAADAA.7278--

--===============1470568924==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1470568924==--
