Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 179B9C38D1
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 17:22:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A660589E32;
	Tue,  1 Oct 2019 15:22:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9D1F689E32
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 15:22:37 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 9485872162; Tue,  1 Oct 2019 15:22:37 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111860] Crash in AMDGPU after resume on VegaM
Date: Tue, 01 Oct 2019 15:22:37 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: phusho@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-111860-502-SLMTuKgu74@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111860-502@http.bugs.freedesktop.org/>
References: <bug-111860-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1501905606=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1501905606==
Content-Type: multipart/alternative; boundary="15699433570.FEB5aEDF.16206"
Content-Transfer-Encoding: 7bit


--15699433570.FEB5aEDF.16206
Date: Tue, 1 Oct 2019 15:22:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111860

--- Comment #7 from Dimitar Atanasov <phusho@yahoo.com> ---
Created attachment 145605
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145605&action=3Dedit
dmesg_resume

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15699433570.FEB5aEDF.16206
Date: Tue, 1 Oct 2019 15:22:37 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crash in AMDGPU after resume on VegaM"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111860#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crash in AMDGPU after resume on VegaM"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111860">bug 11186=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
phusho&#64;yahoo.com" title=3D"Dimitar Atanasov &lt;phusho&#64;yahoo.com&gt=
;"> <span class=3D"fn">Dimitar Atanasov</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145605=
" name=3D"attach_145605" title=3D"dmesg_resume">attachment 145605</a> <a hr=
ef=3D"attachment.cgi?id=3D145605&amp;action=3Dedit" title=3D"dmesg_resume">=
[details]</a></span>
dmesg_resume</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15699433570.FEB5aEDF.16206--

--===============1501905606==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1501905606==--
