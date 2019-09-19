Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F30B7735
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 12:15:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D697B6F6C4;
	Thu, 19 Sep 2019 10:15:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5129D6F4F8
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 10:15:20 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 446F972167; Thu, 19 Sep 2019 10:15:20 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111747] [CI][DRMTIP] igt@ - incomplete - Jenkins gives up
Date: Thu, 19 Sep 2019 10:15:20 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: IGT
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: chris@chris-wilson.co.uk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: short_desc qa_contact assigned_to component
Message-ID: <bug-111747-502-dnPKEvoN5m@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111747-502@http.bugs.freedesktop.org/>
References: <bug-111747-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2137106705=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2137106705==
Content-Type: multipart/alternative; boundary="15688881200.0af2.17780"
Content-Transfer-Encoding: 7bit


--15688881200.0af2.17780
Date: Thu, 19 Sep 2019 10:15:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111747

Chris Wilson <chris@chris-wilson.co.uk> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|[CI][DRMTIP]                |[CI][DRMTIP] igt@ -
                   |igt@gem_fenced_exec_thrash@ |incomplete - Jenkins gives
                   |no-spare-fences -           |up
                   |incomplete                  |
         QA Contact|intel-gfx-bugs@lists.freede |
                   |sktop.org                   |
           Assignee|intel-gfx-bugs@lists.freede |dri-devel@lists.freedesktop
                   |sktop.org                   |.org
          Component|DRM/Intel                   |IGT

--- Comment #2 from Chris Wilson <chris@chris-wilson.co.uk> ---
[37.804681] [11/92] (958s left) gem_fenced_exec_thrash (no-spare-fences)
Starting subtest: no-spare-fences
[39.958307] Abort requested via Terminated, terminating children
[39.958688] Abort requested via Terminated, terminating children
[39.959050] Abort requested via Hangup, terminating children
[39.959085] Abort requested via Hangup, terminating children
[40.581122] Closing watchdogs

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15688881200.0af2.17780
Date: Thu, 19 Sep 2019 10:15:20 +0000
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
          bz_status_NEW "
   title=3D"NEW - [CI][DRMTIP] igt&#64; - incomplete - Jenkins gives up"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111747">bug 11174=
7</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Summary</td>
           <td>[CI][DRMTIP] igt&#64;gem_fenced_exec_thrash&#64;no-spare-fen=
ces - incomplete
           </td>
           <td>[CI][DRMTIP] igt&#64; - incomplete - Jenkins gives up
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
           <td style=3D"text-align:right;">Assignee</td>
           <td>intel-gfx-bugs&#64;lists.freedesktop.org
           </td>
           <td>dri-devel&#64;lists.freedesktop.org
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Component</td>
           <td>DRM/Intel
           </td>
           <td>IGT
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [CI][DRMTIP] igt&#64; - incomplete - Jenkins gives up"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111747#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [CI][DRMTIP] igt&#64; - incomplete - Jenkins gives up"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111747">bug 11174=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
chris&#64;chris-wilson.co.uk" title=3D"Chris Wilson &lt;chris&#64;chris-wil=
son.co.uk&gt;"> <span class=3D"fn">Chris Wilson</span></a>
</span></b>
        <pre>[37.804681] [11/92] (958s left) gem_fenced_exec_thrash (no-spa=
re-fences)
Starting subtest: no-spare-fences
[39.958307] Abort requested via Terminated, terminating children
[39.958688] Abort requested via Terminated, terminating children
[39.959050] Abort requested via Hangup, terminating children
[39.959085] Abort requested via Hangup, terminating children
[40.581122] Closing watchdogs</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15688881200.0af2.17780--

--===============2137106705==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2137106705==--
