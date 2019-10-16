Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 351C3D8B95
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 10:44:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01C966E8FA;
	Wed, 16 Oct 2019 08:44:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id AEED36E8FA
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 08:44:10 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id AC55A7296E; Wed, 16 Oct 2019 08:44:10 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112017] [CI][SHARDS]igt@kms_frontbuffer_tracking@* - fail -
 Failed assertion: drm.bufmgr
Date: Wed, 16 Oct 2019 08:44:07 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: IGT
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: chris@chris-wilson.co.uk
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: FIXED
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component qa_contact resolution bug_status
 assigned_to
Message-ID: <bug-112017-502-MWWlUDSaUC@http.bugs.freedesktop.org/>
In-Reply-To: <bug-112017-502@http.bugs.freedesktop.org/>
References: <bug-112017-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1505319908=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1505319908==
Content-Type: multipart/alternative; boundary="15712154501.6F1d3B.25432"
Content-Transfer-Encoding: 7bit


--15712154501.6F1d3B.25432
Date: Wed, 16 Oct 2019 08:44:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112017

Chris Wilson <chris@chris-wilson.co.uk> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|DRM/Intel                   |IGT
         QA Contact|intel-gfx-bugs@lists.freede |
                   |sktop.org                   |
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED
           Assignee|intel-gfx-bugs@lists.freede |dri-devel@lists.freedesktop
                   |sktop.org                   |.org

--- Comment #2 from Chris Wilson <chris@chris-wilson.co.uk> ---
Glitch in the build matrix.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15712154501.6F1d3B.25432
Date: Wed, 16 Oct 2019 08:44:10 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:chris&#64=
;chris-wilson.co.uk" title=3D"Chris Wilson &lt;chris&#64;chris-wilson.co.uk=
&gt;"> <span class=3D"fn">Chris Wilson</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [CI][SHARDS]igt&#64;kms_frontbuffer_tracking&#=
64;* - fail - Failed assertion: drm.bufmgr"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112017">bug 11201=
7</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Component</td>
           <td>DRM/Intel
           </td>
           <td>IGT
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">QA Contact</td>
           <td>intel-gfx-bugs&#64;lists.freedesktop.org
           </td>
           <td>
               &nbsp;
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>FIXED
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Assignee</td>
           <td>intel-gfx-bugs&#64;lists.freedesktop.org
           </td>
           <td>dri-devel&#64;lists.freedesktop.org
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [CI][SHARDS]igt&#64;kms_frontbuffer_tracking&#=
64;* - fail - Failed assertion: drm.bufmgr"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112017#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [CI][SHARDS]igt&#64;kms_frontbuffer_tracking&#=
64;* - fail - Failed assertion: drm.bufmgr"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112017">bug 11201=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
chris&#64;chris-wilson.co.uk" title=3D"Chris Wilson &lt;chris&#64;chris-wil=
son.co.uk&gt;"> <span class=3D"fn">Chris Wilson</span></a>
</span></b>
        <pre>Glitch in the build matrix.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15712154501.6F1d3B.25432--

--===============1505319908==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1505319908==--
