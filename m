Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A818C260
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 22:56:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EF5189F82;
	Tue, 13 Aug 2019 20:56:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id E297E6E072
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 20:56:45 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id DEB747215A; Tue, 13 Aug 2019 20:56:45 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110509] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx
 timeout
Date: Tue, 13 Aug 2019 20:56:45 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lifeisfoo@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-110509-502-r4EndGuuEv@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110509-502@http.bugs.freedesktop.org/>
References: <bug-110509-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0560043674=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0560043674==
Content-Type: multipart/alternative; boundary="15657298051.Fc1ADa4.17325"
Content-Transfer-Encoding: 7bit


--15657298051.Fc1ADa4.17325
Date: Tue, 13 Aug 2019 20:56:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110509

Alessandro <lifeisfoo@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |lifeisfoo@gmail.com

--- Comment #15 from Alessandro <lifeisfoo@gmail.com> ---
Created attachment 145050
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145050&action=3Dedit
dmsg drm amdgpu

I'm facing the same issue with 5.2.x and 5.3-rc4 kernel and a Radeon RX 580.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15657298051.Fc1ADa4.17325
Date: Tue, 13 Aug 2019 20:56:45 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:lifeisfoo=
&#64;gmail.com" title=3D"Alessandro &lt;lifeisfoo&#64;gmail.com&gt;"> <span=
 class=3D"fn">Alessandro</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeo=
ut"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110509">bug 11050=
9</a>
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
           <td>lifeisfoo&#64;gmail.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeo=
ut"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110509#c15">Comme=
nt # 15</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeo=
ut"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110509">bug 11050=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
lifeisfoo&#64;gmail.com" title=3D"Alessandro &lt;lifeisfoo&#64;gmail.com&gt=
;"> <span class=3D"fn">Alessandro</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145050=
" name=3D"attach_145050" title=3D"dmsg drm amdgpu">attachment 145050</a> <a=
 href=3D"attachment.cgi?id=3D145050&amp;action=3Dedit" title=3D"dmsg drm am=
dgpu">[details]</a></span>
dmsg drm amdgpu

I'm facing the same issue with 5.2.x and 5.3-rc4 kernel and a Radeon RX 580=
.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15657298051.Fc1ADa4.17325--

--===============0560043674==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0560043674==--
