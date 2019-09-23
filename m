Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 701FBBBE3F
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 00:04:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 238D489FC8;
	Mon, 23 Sep 2019 22:04:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id DF14489FC8
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 22:04:29 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id DC44B72162; Mon, 23 Sep 2019 22:04:29 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: =?UTF-8?B?W0J1ZyAxMTE3NjFdIExhdGVzdCBHaXQgS2VybmVsIGRvZXNu4oCZdCBib290?=
 =?UTF-8?B?IHdpdGggUmFkZW9uIE5JIHdpdGggdGhlIGRybS1uZXh0LTIwMTktMDktMTgg?=
 =?UTF-8?B?dXBkYXRlcw==?=
Date: Mon, 23 Sep 2019 22:04:30 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/Radeon
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: chzigotzky@xenosoft.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-111761-502-Ufsc5iQrak@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111761-502@http.bugs.freedesktop.org/>
References: <bug-111761-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1403029567=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1403029567==
Content-Type: multipart/alternative; boundary="15692762691.C893f1f.15996"
Content-Transfer-Encoding: 7bit


--15692762691.C893f1f.15996
Date: Mon, 23 Sep 2019 22:04:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111761

Christian Zigotzky <chzigotzky@xenosoft.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #145482|0                           |1
        is obsolete|                            |

--- Comment #4 from Christian Zigotzky <chzigotzky@xenosoft.de> ---
Created attachment 145483
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145483&action=3Dedit
This patch reverts the changes in "drivers/gpu/drm/drm" and "include/drm/".

I created a patch today. This patch reverts the changes in the following fi=
les.

- drivers/gpu/drm/drm_*
- include/drm/*

It also reverts all files which depends on these files above.=20

Now I can boot the latest Git kernel with my Radeon HD NI graphics cards ag=
ain.

Please check the updates in the files

- drivers/gpu/drm/drm_*
- include/drm/*

Thanks

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15692762691.C893f1f.15996
Date: Mon, 23 Sep 2019 22:04:29 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:chzigotzk=
y&#64;xenosoft.de" title=3D"Christian Zigotzky &lt;chzigotzky&#64;xenosoft.=
de&gt;"> <span class=3D"fn">Christian Zigotzky</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Latest Git Kernel doesn=E2=80=99t boot with Radeon NI wit=
h the drm-next-2019-09-18 updates"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111761">bug 11176=
1</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Attachment #145482 is obsolete</=
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
   title=3D"NEW - Latest Git Kernel doesn=E2=80=99t boot with Radeon NI wit=
h the drm-next-2019-09-18 updates"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111761#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Latest Git Kernel doesn=E2=80=99t boot with Radeon NI wit=
h the drm-next-2019-09-18 updates"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111761">bug 11176=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
chzigotzky&#64;xenosoft.de" title=3D"Christian Zigotzky &lt;chzigotzky&#64;=
xenosoft.de&gt;"> <span class=3D"fn">Christian Zigotzky</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145483=
" name=3D"attach_145483" title=3D"This patch reverts the changes in &quot;d=
rivers/gpu/drm/drm&quot; and &quot;include/drm/&quot;.">attachment 145483</=
a> <a href=3D"attachment.cgi?id=3D145483&amp;action=3Dedit" title=3D"This p=
atch reverts the changes in &quot;drivers/gpu/drm/drm&quot; and &quot;inclu=
de/drm/&quot;.">[details]</a></span> <a href=3D'page.cgi?id=3Dsplinter.html=
&amp;bug=3D111761&amp;attachment=3D145483'>[review]</a>
This patch reverts the changes in &quot;drivers/gpu/drm/drm&quot; and &quot=
;include/drm/&quot;.

I created a patch today. This patch reverts the changes in the following fi=
les.

- drivers/gpu/drm/drm_*
- include/drm/*

It also reverts all files which depends on these files above.=20

Now I can boot the latest Git kernel with my Radeon HD NI graphics cards ag=
ain.

Please check the updates in the files

- drivers/gpu/drm/drm_*
- include/drm/*

Thanks</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15692762691.C893f1f.15996--

--===============1403029567==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1403029567==--
