Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2773EA6A35
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 15:42:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3FE6892BD;
	Tue,  3 Sep 2019 13:42:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 23D86892BD
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 13:42:47 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id F2ABF72161; Tue,  3 Sep 2019 13:42:46 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111551] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma1
 timeout
Date: Tue, 03 Sep 2019 13:42:45 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: 78666679@qq.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-111551-502-jESzALmQJS@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111551-502@http.bugs.freedesktop.org/>
References: <bug-111551-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0150849971=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0150849971==
Content-Type: multipart/alternative; boundary="15675181660.2caeaebC.13850"
Content-Transfer-Encoding: 7bit


--15675181660.2caeaebC.13850
Date: Tue, 3 Sep 2019 13:42:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111551

yanhua <78666679@qq.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |78666679@qq.com

--- Comment #1 from yanhua <78666679@qq.com> ---
Created attachment 145253
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145253&action=3Dedit
dmesg output

grep drm dmesg.txt. there are sdma1 ring timout

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15675181660.2caeaebC.13850
Date: Tue, 3 Sep 2019 13:42:46 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:78666679&=
#64;qq.com" title=3D"yanhua &lt;78666679&#64;qq.com&gt;"> <span class=3D"fn=
">yanhua</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma1 tim=
eout"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111551">bug 11155=
1</a>
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
           <td>78666679&#64;qq.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma1 tim=
eout"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111551#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma1 tim=
eout"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111551">bug 11155=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
78666679&#64;qq.com" title=3D"yanhua &lt;78666679&#64;qq.com&gt;"> <span cl=
ass=3D"fn">yanhua</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145253=
" name=3D"attach_145253" title=3D"dmesg output">attachment 145253</a> <a hr=
ef=3D"attachment.cgi?id=3D145253&amp;action=3Dedit" title=3D"dmesg output">=
[details]</a></span>
dmesg output

grep drm dmesg.txt. there are sdma1 ring timout</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15675181660.2caeaebC.13850--

--===============0150849971==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0150849971==--
