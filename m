Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A785BA38AD2
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 18:43:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8453510E571;
	Mon, 17 Feb 2025 17:43:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7237C10E179;
 Mon, 17 Feb 2025 17:43:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6F935A41A5E;
 Mon, 17 Feb 2025 17:42:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0E76C4CED1;
 Mon, 17 Feb 2025 17:43:50 +0000 (UTC)
Date: Mon, 17 Feb 2025 12:44:10 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, linux-kernel@vger.kernel.org,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, Dave Airlie
 <airlied@redhat.com>, Simona Vetter <simona.vetter@ffwll.ch>, Karol Herbst
 <kherbst@redhat.com>
Subject: Re: [PATCH 1/1] MAINTAINERS: Remove myself
Message-ID: <20250217124410.72a67bf8@gandalf.local.home>
In-Reply-To: <Z7MrLUlSzS_I3YPK@cassiopeiae>
References: <20250215073753.1217002-1-kherbst@redhat.com>
 <20250215073753.1217002-2-kherbst@redhat.com>
 <Z7MrLUlSzS_I3YPK@cassiopeiae>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 17 Feb 2025 13:27:25 +0100
Danilo Krummrich <dakr@kernel.org> wrote:

> > Signed-off-by: Karol Herbst <kherbst@redhat.com>  
> 
> @Steven, @Masami: Can I get an ACK for taking this through the drm-misc tree?
> 
> (Not cutting any context, since you have not been copied on this one.)

Sure,

Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>

-- Steve

> 
> - Danilo
> 
> > ---
> >  MAINTAINERS | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 25c86f47353de..ca31e57fa203c 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -7431,7 +7431,6 @@ F:	Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
> >  F:	drivers/gpu/drm/panel/panel-novatek-nt36672a.c
> >  
> >  DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS
> > -M:	Karol Herbst <kherbst@redhat.com>
> >  M:	Lyude Paul <lyude@redhat.com>
> >  M:	Danilo Krummrich <dakr@kernel.org>
> >  L:	dri-devel@lists.freedesktop.org
> > @@ -24062,7 +24061,6 @@ F:	tools/testing/selftests/ftrace/
> >  TRACING MMIO ACCESSES (MMIOTRACE)
> >  M:	Steven Rostedt <rostedt@goodmis.org>
> >  M:	Masami Hiramatsu <mhiramat@kernel.org>
> > -R:	Karol Herbst <karolherbst@gmail.com>
> >  R:	Pekka Paalanen <ppaalanen@gmail.com>
> >  L:	linux-kernel@vger.kernel.org
> >  L:	nouveau@lists.freedesktop.org
